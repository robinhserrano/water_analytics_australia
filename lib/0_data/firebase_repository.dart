import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionPath = 'sales.order';

  Future<bool> saveSales(SalesOrder job) async {
    try {
      final docRef = _firestore.collection(_collectionPath).doc(
            job.name.toString(),
          );

      final data = <String, dynamic>{
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
      };
      await docRef.set(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<List<SalesEntity>> getSales() async {
  //   final querySnapshot = await _firestore.collection(_collectionPath).get();
  //   final jobs = querySnapshot.docs.map(SalesEntity.fromFirestore).toList();
  //   return jobs;
  // }

  // Future<SalesEntity?> getSaleById(String id) async {
  //   final docSnapshot =
  //       await _firestore.collection(_collectionPath).doc(id).get();
  //   if (docSnapshot.exists) {
  //     return SalesEntity.fromFirestore(docSnapshot);
  //   } else {
  //     return null;
  //   }
  // }

  // Future<bool> deleteSaleById(String saleId) async {
  //   try {
  //     final docRef = _firestore.collection(_collectionPath).doc(saleId);
  //     await docRef.delete();
  //     return true;
  //   } on FirebaseException catch (e) {
  //     throw Exception('Failed to delete job: ${e.message}');
  //   } catch (_) {
  //     return false;
  //   }
  // }
}
