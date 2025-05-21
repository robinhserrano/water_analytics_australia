// ignore_for_file: prefer_int_literals, avoid_positional_boolean_parameters

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';
import 'package:water_analytics_australia/core/temp.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _usersPath = 'users';
  final String _salesOrderPath = 'sales.order';
  final String _timestampPath = 'last.upload.time';
  final String _landingPricePath = 'landing.price';

  Future<bool> saveSales(
    SalesOrder job, {
    bool isConfirmedByManager = false,
  }) async {
    try {
      final docRef = _firestore.collection(_salesOrderPath).doc(
            job.name.toString(),
          );

      final data = <String, dynamic>{
        'name': job.name,
        'create_date': job.createDate,
        'partner_id_display_name': job.partnerId?.displayName,
        'partner_id_contact_address': job.partnerId?.contactAddress,
        'partner_id_phone': job.partnerId?.phone,
        'x_studio_sales_rep_1': job.xStudioSalesRep1,
        'x_studio_sales_source': job.xStudioSalesSource,
        'x_studio_commission_paid': job.xStudioCommissionPaid,
        'x_studio_referrer_processed': job.xStudioReferrerProcessed,
        'x_studio_payment_type': job.xStudioPaymentType,
        'amount_total': job.amountTotal,
        'amount_untaxed': job.taxTotals?.amountUntaxed,
        'delivery_status': job.deliveryStatus,
        'amount_to_invoice': job.amountToInvoice,
        'x_studio_invoice_payment_status': job.xStudioInvoicePaymentStatus,
        'internal_note_display': job.internalNoteDisplay,
        'state': job.state,
      };
      await docRef.set(data);

      if (job.orderLine != null) {
        for (final order in job.orderLine!) {
          await saveOrderLine(job.name!, order);
        }
      }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<CloudSalesOrder>?> getSales() async {
    try {
      final querySnapshot = await _firestore.collection(_salesOrderPath).get();
      final order =
          querySnapshot.docs.map(CloudSalesOrder.fromFirestore).toList();

      final orders = <CloudSalesOrder>[];

      // for (final item in order) {
      //   //final orderLines = await getOrderLinesById(item.name!);

      //   final confirmedByManager = await getConfirmedByManagerById(item.name!);
      //   final additionalDeduction = await getAdditionalDeduction(item.name!);

      //   final order = item.copyWith(
      //     // orderLines: orderLines,
      //     confirmedByManager: confirmedByManager,
      //     additionalDeduction: additionalDeduction,
      //   );

      //   orders.add(order);
      //   print('a');
      //   //    print('A ')
      // }

      return order;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<CloudSalesOrder>?> getSalesWithOrderLines() async {
    try {
      final querySnapshot = await _firestore.collection(_salesOrderPath).get();
      final order =
          querySnapshot.docs.map(CloudSalesOrder.fromFirestore).toList();
      return order;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<CloudSalesOrder?> getSaleById(String id) async {
    final docSnapshot =
        await _firestore.collection(_salesOrderPath).doc(id).get();

    final confirmedByManager = await getConfirmedByManagerById(id);
    final additionalDeduction = await getAdditionalDeduction(id);

    if (docSnapshot.exists) {
      final sale = CloudSalesOrder.fromFirestore(docSnapshot);

      return sale.copyWith(
        confirmedByManager: confirmedByManager,
        additionalDeduction: additionalDeduction,
      );
    } else {
      return null;
    }
  }

  Future<List<CloudOrderLines>?> getOrderLinesById(String id) async {
    try {
      final docSnapshot = await _firestore
          .collection(_salesOrderPath)
          .doc(id)
          .collection('order_line')
          .get();

      final lala = docSnapshot;

      final order =
          docSnapshot.docs.map(CloudOrderLines.fromFirestore).toList();
      var hehe = order;
      var hihi = hehe;
      return order;
    } catch (e) {
      return null;
    }
  }

  Future<bool> saveLastUploadedTime(DateTime timeStamp) async {
    try {
      final docRef = _firestore.collection(_timestampPath).doc(
            'lastUploadTime',
          );

      final data = <String, dynamic>{
        'timeStamp': timeStamp,
      };
      await docRef.set(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<DateTime?> getLastUploadedTime() async {
    try {
      final docSnapshot = await _firestore
          .collection(_timestampPath)
          .doc('lastUploadTime')
          .get();
      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        if (data != null && data['timeStamp'] != null) {
          return (data['timeStamp'] as Timestamp).toDate();
        }
      }
      return null; // Return null if no timestamp is found
    } catch (e) {
      print(e);
      return null; // Return null in case of any error
    }
  }

  Future<List<CloudLandingPrice>?> getLandingPrices() async {
    try {
      final querySnapshot =
          await _firestore.collection(_landingPricePath).get();
      final order =
          querySnapshot.docs.map(CloudLandingPrice.fromFirestore).toList();
      return order;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> saveLandingPrice(LandingPrice landingPrice) async {
    try {
      final docRef = _firestore.collection(_landingPricePath).doc(
            landingPrice.internalReference,
          );

      final data = <String, dynamic>{
        'name': landingPrice.name,
        'internalReference': landingPrice.internalReference,
        'productCategory': landingPrice.productCategory,
        'installationService': landingPrice.installationService,
        'supplyOnly': landingPrice.supplyOnly,
      };
      await docRef.set(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<CloudLandingPrice?> getLandingPrice(String id) async {
    final docSnapshot =
        await _firestore.collection(_landingPricePath).doc(id).get();
    if (docSnapshot.exists) {
      return CloudLandingPrice.fromFirestore(docSnapshot);
    } else {
      return null;
    }
  }

  Future<bool> saveOrderLine(String jobName, OrderLine item) async {
    try {
      final docRef = _firestore
          .collection(_salesOrderPath)
          .doc(
            jobName,
          )
          .collection('order_line')
          .doc(
            generateMd5('${item.productTemplateId?.displayName ?? ''}'
                '_${item.name ?? ''}'),
          );

      final data = <String, dynamic>{
        'product': item.productTemplateId?.displayName ?? '',
        'description': item.name,
        'quantity': item.productUomQty,
        'delivered': item.qtyDelivered,
        'invoiced': item.qtyInvoiced,
        'unit_price': item.priceUnit,
        'taxes':
            (item.taxId?.isNotEmpty ?? false) ? item.taxId![0].displayName : '',
        'disc': item.discount,
        'taxExcl': item.priceSubtotal,
      };
      await docRef.set(data);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<CloudUser>?> getUsers() async {
    try {
      final querySnapshot = await _firestore.collection(_usersPath).get();
      final users = querySnapshot.docs.map(CloudUser.fromFirestore).toList();
      return users;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<CloudUser?> getUserById(String id) async {
    final docSnapshot = await _firestore.collection(_usersPath).doc(id).get();
    if (docSnapshot.exists) {
      return CloudUser.fromFirestore(docSnapshot);
    } else {
      return null;
    }
  }

  Future<bool> updateUserById(CloudUser user) async {
    try {
      final docRef = _firestore.collection(_usersPath).doc(
            user.email,
          );

      final data = <String, dynamic>{
        'displayName': user.displayName,
        'email': user.email,
        'photoUrl': user.photoUrl,
        'accessLevel': user.accessLevel,
        'commissionSplit': user.commissionSplit,
      };
      await docRef.set(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> saveConfirmedByManager(
    String jobName,
    bool isConfirmed,
  ) async {
    try {
      final docRef = _firestore
          .collection(_salesOrderPath)
          .doc(
            jobName,
          )
          .collection('confirmed_by_manager')
          .doc(generateMd5(jobName));

      final user = await HiveHelper.getAllUsers();

      final data = <String, dynamic>{
        'is_confirmed': isConfirmed,
        'last_updated_by': user.first.email,
        'updated_at': DateTime.now(),
      };
      await docRef.set(data);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<CloudConfirmedByManager?> getConfirmedByManagerById(
    String jobName,
  ) async {
    final docSnapshot = await _firestore
        .collection(_salesOrderPath)
        .doc(jobName)
        .collection('confirmed_by_manager')
        .doc(generateMd5(jobName))
        .get();

    if (docSnapshot.exists) {
      return CloudConfirmedByManager.fromFirestore(docSnapshot);
    } else {
      return null;
    }
  }

  Future<bool> saveAdditionalDeduction(
    String jobName,
    double additionalDeduction,
  ) async {
    try {
      final docRef = _firestore
          .collection(_salesOrderPath)
          .doc(
            jobName,
          )
          .collection('additional_deduction')
          .doc(generateMd5(jobName));

      final user = await HiveHelper.getAllUsers();

      final data = <String, dynamic>{
        'additional_deduction': additionalDeduction,
        'last_updated_by': user.first.email,
        'updated_at': DateTime.now(),
      };
      await docRef.set(data);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<CloudAdditionalDeduction?> getAdditionalDeduction(
    String jobName,
  ) async {
    final docSnapshot = await _firestore
        .collection(_salesOrderPath)
        .doc(jobName)
        .collection('additional_deduction')
        .doc(generateMd5(jobName))
        .get();

    if (docSnapshot.exists) {
      return CloudAdditionalDeduction.fromFirestore(docSnapshot);
    } else {
      return null;
    }
  }

  // Future<bool> createUser(){
  //     final userData = {
  //           'displayName': googleUser.displayName,
  //           'email': googleUser.email,
  //           'photoUrl': googleUser.photoUrl,
  //           'accessLevel': accessLevel,
  //           'commissionSplit': 50,
  //           // Add other relevant user profile fields as needed (e.g., photoURL)
  //           // ...
  //         };
  //         await userRef.set(userData);
  // }

  // Future<CloudSalesOrder?> getLastUploadedTime() async {
  //   final docSnapshot =
  //       await _firestore.collection(_timestampPath).doc('lastUploadTime').get();

  //   if (docSnapshot.exists) {
  //     return CloudSalesOrder.fromFirestore(docSnapshot);
  //   } else {
  //     return null;
  //   }
  // }

  // Future<bool> deleteSaleById(String saleId) async {
  //   try {
  //     final docRef = _firestore.collection(_salesOrderPath).doc(saleId);
  //     await docRef.delete();
  //     return true;
  //   } on FirebaseException catch (e) {
  //     throw Exception('Failed to delete job: ${e.message}');
  //   } catch (_) {
  //     return false;
  //   }
  // }
}
