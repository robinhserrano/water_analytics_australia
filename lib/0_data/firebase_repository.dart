import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _salesOrderPath = 'sales.order';
  final String _timestampPath = 'last.upload.time';
  final String _landingPricePath = 'landing.price';

  Future<bool> saveSales(SalesOrder job) async {
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
        'delivery_status': job.deliveryStatus,
        'amount_to_invoice': job.amountToInvoice,
        'x_studio_invoice_payment_status': job.xStudioInvoicePaymentStatus,
        'internal_note_display': job.internalNoteDisplay,
        'state': job.state,
      };
      await docRef.set(data);
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
      return order;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<CloudSalesOrder?> getSaleById(String id) async {
    final docSnapshot =
        await _firestore.collection(_salesOrderPath).doc(id).get();
    if (docSnapshot.exists) {
      return CloudSalesOrder.fromFirestore(docSnapshot);
    } else {
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
