import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/0_data/odoo_repository.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
part 'sales_state.dart';

class SalesCubit extends Cubit<SalesCubitState> {
  SalesCubit({
    required this.odooRepo,
    required this.firestoreService,
    required this.repo,
  }) : super(const SalesStateLoading()) {
    fetchSales();
  }

  final OdooRepository odooRepo;
  final FirebaseFirestoreService firestoreService;
  final Repository repo;

  Future<void> fetchSales() async {
    emit(const SalesStateLoading());
    try {
      final data = await odooRepo.fetchSales();
      if (data != null) {
        print('totalllll ' + data.length.toString());
        var filteredData = data.where((e) => e.state == 'sale').toList();
        print('sales only :  ' + filteredData.toString());

        emit(SalesStateLoaded(filteredData));
      } else {
        emit(const SalesStateError(message: 'Sales Failed'));
      }
    } catch (e) {
      emit(SalesStateError(message: e.toString()));
    }
  }

  Future<bool> saveAwsSalesBulk(
    List<SalesOrder> sales,
    void Function(double) onProgress,
  ) async {
    final totalSales = sales.length;
    var savedCount = 0;

    try {
      final dataList = <Map<String, dynamic>>[];
      for (final salesOrder in sales) {
        dataList.add({
          'amount_to_invoice': salesOrder.amountToInvoice,
          'amount_total': salesOrder.amountTotal,
          'amount_untaxed': salesOrder.taxTotals?.amountUntaxed,
          'create_date': salesOrder.createDate?.toIso8601String(),
          'delivery_status': salesOrder.deliveryStatus,
          'internal_note_display': salesOrder.internalNoteDisplay,
          'name': salesOrder.name,
          'partner_id_contact_address': salesOrder.partnerId?.contactAddress,
          'partner_id_display_name': salesOrder.partnerId?.displayName,
          'partner_id_phone': salesOrder.partnerId?.phone,
          'state': salesOrder.state,
          'x_studio_commission_paid': salesOrder.xStudioCommissionPaid ? 1 : 0,
          'x_studio_invoice_payment_status':
              salesOrder.xStudioInvoicePaymentStatus,
          'x_studio_payment_type': salesOrder.xStudioPaymentType,
          'x_studio_referrer_processed':
              salesOrder.xStudioReferrerProcessed ? 1 : 0,
          'x_studio_sales_rep_1': salesOrder.xStudioSalesRep1,
          'x_studio_sales_source': salesOrder.xStudioSalesSource,
          'order_line': salesOrder.orderLine != null
              ? salesOrder.orderLine!
                  .map(
                    (e) => {
                      'product': e.productTemplateId?.displayName ?? '',
                      'description': e.name,
                      'quantity': e.productUomQty,
                      'delivered': e.qtyDelivered,
                      'invoiced': e.qtyInvoiced,
                      'unit_price': e.priceUnit,
                      'taxes': e.taxId?.isNotEmpty ?? false
                          ? e.taxId![0].displayName
                          : '',
                      'disc': e.discount,
                      'tax_excl': e.priceSubtotal,
                    },
                  )
                  .toList()
              : [],
        });
      }

      const chunkSize = 500; // Maximum entries per file
      // var fileCount = 1; // Counter for file names

      var currentChunk = <Map<String, dynamic>>[];

      for (final salesOrder in dataList) {
        currentChunk.add(salesOrder);
        if (currentChunk.length == chunkSize) {
          // Reached chunk size, save data and create a new chunk
          //  await _saveSalesDataToFile(currentChunk, fileCount);
          await repo.saveAwsSalesBulk(currentChunk);
          final progress = (currentChunk.length / totalSales) * 100;
          onProgress(progress);
          currentChunk = [];
          //  fileCount++;
        }
      }

      // Save any remaining data in the last chunk
      if (currentChunk.isNotEmpty) {
        await repo.saveAwsSalesBulk(currentChunk);
        final progress = (totalSales / totalSales) * 100;
        onProgress(progress);
      }

      // for (final sale in sales) {
      //   await firestoreService.saveSales(sale);
      //   savedCount++;
      //   final progress = (savedCount / totalSales) * 100;
      //   onProgress(progress); // Update progress callback
      // }
      await firestoreService.saveLastUploadedTime(DateTime.now());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveAllSalesBu(
    List<SalesOrder> sales,
    void Function(double) onProgress,
  ) async {
    final totalSales = sales.length;
    var savedCount = 0;

    try {
      for (final sale in sales) {
        await firestoreService.saveSales(sale);
        savedCount++;
        final progress = (savedCount / totalSales) * 100;
        onProgress(progress); // Update progress callback
      }
      await firestoreService.saveLastUploadedTime(DateTime.now());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveAllSalesAws(
    List<SalesOrder> sales,
    void Function(double) onProgress,
  ) async {
    final totalSales = sales.length;
    var savedCount = 0;

    try {
      for (final sale in sales) {
        final success = await repo.saveSales(sale);
        print(success);
        savedCount++;
        final progress = (savedCount / totalSales) * 100;
        onProgress(progress); // Update progress callback
      }
      // await firestoreService.saveLastUploadedTime(DateTime.now());
      return true;
    } catch (e) {
      return false;
    }
  }

  // Future<bool> saveAllSalesAwsBulk(
  //   List<SalesOrder> sales,
  //   void Function(double) onProgress,
  // ) async {
  //   final totalSales = sales.length;
  //   var savedCount = 0;

  //   try {
  //     for (final sale in sales) {
  //       final success = await repo.saveAllSalesBulk(sale);
  //       print(success);
  //       savedCount++;
  //       final progress = (savedCount / totalSales) * 100;
  //       onProgress(progress); // Update progress callback
  //     }
  //     // await firestoreService.saveLastUploadedTime(DateTime.now());
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  Future<bool> saveAllSalesAwsBulk(
    List<SalesOrder> sales,
    void Function(double) onProgress,
  ) async {
    final totalSales = sales.length;
    var savedCount = 0;

    try {
      //repo.saveAllSalesBulk(currentBatch);

      await repo.saveAllSalesBulk(sales.sublist(0, 10));
      // for (var i = 0; i < sales.length; i += 10) {
      //   final endIndex = i + 10;
      //   final currentBatch = sales.sublist(
      //       i,
      //       endIndex < sales.length
      //           ? endIndex
      //           : sales.length); // Handle end-of-list case

      //   final batchSuccess = await repo.saveAllSalesBulk(currentBatch);

      //   final processedSales = currentBatch.length;
      //   savedCount += processedSales;
      //   final progress = (savedCount / totalSales) * 100;
      //   onProgress(progress); // Update progress callback

      //   if (!batchSuccess) {
      //     print('Failed to save batch of SalesOrders.');
      //     return false; // Handle error for the entire batch (optional)
      //   }
      // }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<bool> saveAllSalesAwsBulk(
  //   List<SalesOrder> sales,
  //   void Function(double) onProgress,
  // ) async {
  //   final totalSales = sales.length;
  //   var savedCount = 0;

  //   try {
  //     for (var i = 0; i < sales.length; i += 10) {
  //       final currentBatch = sales.sublist(i, i + 10);
  //       final batchSuccess =
  //           await Future.wait(currentBatch.map(repo.saveSales));

  //       // Update progress based on processed batches
  //       final processedSales = currentBatch.length;
  //       savedCount += processedSales;
  //       final progress = (savedCount / totalSales) * 100;
  //       onProgress(progress);

  //       if (!batchSuccess.every((success) => success)) {
  //         // Handle partial failure (optional)
  //         print('Some items in the batch failed to save.');
  //         break; // Or continue processing based on your needs
  //       }
  //     }

  //     // await firestoreService.saveLastUploadedTime(DateTime.now());
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  Future<bool> saveLandingPrice(List<LandingPrice> landingPrices) async {
    try {
      for (final price in landingPrices) {
        await firestoreService.saveLandingPrice(price);
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  //   Future<bool> saveAllSalesAwsBulk(
  //   List<SalesOrder> sales,
  //   void Function(double) onProgress,
  // ) async {
  //   final totalSales = sales.length;
  //   var savedCount = 0;

  //   try {
  //     for (var i = 0; i < sales.length; i += 10) {
  //       final currentBatch = sales.sublist(i, i + 10);
  //       final batchSuccess =
  //           await Future.wait(currentBatch.map(repo.saveSales));

  //       // Update progress based on processed batches
  //       final processedSales = currentBatch.length;
  //       savedCount += processedSales;
  //       final progress = (savedCount / totalSales) * 100;
  //       onProgress(progress);

  //       if (!batchSuccess.every((success) => success)) {
  //         // Handle partial failure (optional)
  //         print('Some items in the batch failed to save.');
  //         break; // Or continue processing based on your needs
  //       }
  //     }

  //     // await firestoreService.saveLastUploadedTime(DateTime.now());
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

//   Future<bool> saveAllSalesBulk(
//   List<SalesOrder> salesOrders,
// ) async {
//   final totalSales = salesOrders.length;
//   var savedCount = 0;

//   try {
//     for (var i = 0; i < salesOrders.length; i += 10) {
//       final currentBatch = salesOrders.sublist(i, i + 10);
//       final batchDataList = currentBatch.map((salesOrder) => _prepareSalesOrderData(salesOrder)).toList();

//       final response = await client.post<dynamic>(
//         'http://3.27.69.251/salesOrder',
//         options: Options(
//           headers: {
//             HttpHeaders.authorizationHeader: 'Bearer 1|uNKKybwei0tpPyD5hj9yvnEM6xwQhp7GOskCcHocd9171b40',
//             HttpHeaders.contentTypeHeader: 'application/json',
//             HttpHeaders.acceptHeader: 'application/json',
//           },
//         ),
//         data: batchDataList,
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final processedSales = currentBatch.length;
//         savedCount += processedSales;
//         final progress = (savedCount / totalSales) * 100;
//         onProgress(progress); // Update progress callback
//       } else {
//         print('Failed to save batch of SalesOrders. Status code: ${response.statusCode}');
//         return false; // Handle error for the entire batch
//       }
//     }

//     return true;
//   } catch (e) {
//     print(e);
//     return false;
//   }
// }
}
