import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/0_data/odoo_repository.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';
part 'aws_sales_state.dart';

class AwsSalesCubit extends Cubit<AwsSalesCubitState> {
  AwsSalesCubit({
    required this.odooRepo,
    required this.firestoreService,
    required this.repo,
  }) : super(const AwsSalesStateLoading()) {
    fetchSales();
  }

  final OdooRepository odooRepo;
  final FirebaseFirestoreService firestoreService;
  final Repository repo;

  Future<void> fetchSales(//List<String> seletectedNames
      ) async {
    emit(const AwsSalesStateLoading());
    try {
      final user = await HiveHelper.getCurrentUser();

      List<AwsSalesOrder>? salesData;

      // //ACCESS RESTRICTION
      if (user?.accessLevel == 1) {
        salesData = await repo.fetchSalesByReps([user?.displayName ?? '']);
      } else if (user?.accessLevel == 2 || user?.accessLevel == 3) {
        final users = await repo.fetchUsers();
        final userNames = users!.map((e) => e.displayName).toList();
        salesData = await repo.fetchSalesByReps(userNames);
      } else {
        //var salesDatas = await repo.fetchSalesPaginated(50, 1);
        salesData = await repo.fetchSales();
      }

      final landingPriceData = await repo.fetchLandingPrices();

      if (salesData != null && landingPriceData != null) {
        print('totalllll ' + salesData.length.toString());
        final filteredsalesData =
            salesData.where((e) => e.state == 'sale').toList();
        print('sales only :  ' + filteredsalesData.toString());

        emit(AwsSalesStateLoaded(filteredsalesData, landingPriceData));
      } else {
        emit(const AwsSalesStateError(message: 'Sales Failed'));
      }
    } catch (e) {
      emit(AwsSalesStateError(message: e.toString()));
    }
  }

  Future<bool> saveAllSales(
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

  Future<void> updateSalesLocal(
    List<AwsSalesOrder> salesOrders,
    AwsSalesOrder newSales,
  ) async {
    final index =
        salesOrders.indexWhere((salesOrder) => salesOrder.id == newSales.id);
    var hehe = index;

    var before = salesOrders[index];
    if (index != -1) {
      // Replace the existing sales order with the new one
      salesOrders[index] = newSales;
    } else {
      // Add the new sales order if no match is found
      salesOrders.add(newSales);
    }
    var after = salesOrders[index];
    var lala;
    emit(AwsSalesStateLoaded(salesOrders, []));
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

  // Future<bool> saveAllSalesAwsBulk(
  //   List<SalesOrder> sales,
  //   void Function(double) onProgress,
  // ) async {
  //   final totalSales = sales.length;
  //   var savedCount = 0;

  //   try {
  //     for (var i = 0; i < sales.length; i += 10) {
  //       final endIndex = i + 10;
  //       final currentBatch = sales.sublist(
  //           i,
  //           endIndex < sales.length
  //               ? endIndex
  //               : sales.length); // Handle end-of-list case

  //       final batchSuccess = await repo.saveAllSalesBulk(currentBatch);

  //       final processedSales = currentBatch.length;
  //       savedCount += processedSales;
  //       final progress = (savedCount / totalSales) * 100;
  //       onProgress(progress); // Update progress callback

  //       if (!batchSuccess) {
  //         print('Failed to save batch of SalesOrders.');
  //         return false; // Handle error for the entire batch (optional)
  //       }
  //     }

  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

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

  Future<bool> createAwsUser(AwsUser user) async {
    try {
      final success = await repo.createUser(user);

      return success;
    } catch (e) {
      return false;
    }
  }

  Future<List<AwsUser>> fetchAwsUsers() async {
    try {
      final users = await repo.fetchUsers();

      return users ?? [];
    } catch (e) {
      return [];
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
//       final batchsalesDataList = currentBatch.map((salesOrder) => _prepareSalesOrdersalesData(salesOrder)).toList();

//       final response = await client.post<dynamic>(
//         'http://3.27.69.251/salesOrder',
//         options: Options(
//           headers: {
//             HttpHeaders.authorizationHeader: 'Bearer 1|uNKKybwei0tpPyD5hj9yvnEM6xwQhp7GOskCcHocd9171b40',
//             HttpHeaders.contentTypeHeader: 'application/json',
//             HttpHeaders.acceptHeader: 'application/json',
//           },
//         ),
//         salesData: batchsalesDataList,
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

  Future<bool> updateConfirmedBy(
      int userId, String name, bool confirmedByManager) async {
    try {
      final success =
          await repo.updateConfirmedBy(userId, name, confirmedByManager);

      return success;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateEnteredOdooBy(
      int userId, String name, bool isEnteredOdoo) async {
    try {
      final success =
          await repo.updateEnteredOdooBy(userId, name, isEnteredOdoo);

      return success;
    } catch (e) {
      return false;
    }
  }
}
