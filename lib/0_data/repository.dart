// ignore_for_file: inference_failure_on_collection_literal

import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';

class Repository {
  Repository({required this.client});
  final Dio client;

  Future<bool> saveSales(
    SalesOrder job,
    //    {
    //   bool isConfirmedByManager = false,
    // }
  ) async {
    try {
      client.interceptors.add(ChuckerDioInterceptor());
      // final docRef = _firestore.collection(_salesOrderPath).doc(
      //       job.name.toString(),
      //     );
      const url = 'http://3.27.69.251'; //staging
      //const url = 'http://54.227.19.30'; //prod

      // Replace 'YOUR_BEARER_TOKEN' with your actual bearer token
      const token = '1|uNKKybwei0tpPyD5hj9yvnEM6xwQhp7GOskCcHocd9171b40';
      //const token = '1|zilDDO1XsRL2qnsws8d9L1xRDKO1ZQ3PejBNt5NW248c3000';

      // final data = <String, dynamic>{
      //   'name': job.name,
      //   'create_date': job.createDate?.toIso8601String(),
      //   'partner_id_display_name': job.partnerId?.displayName,
      //   'partner_id_contact_address': job.partnerId?.contactAddress,
      //   'partner_id_phone': job.partnerId?.phone,
      //   'x_studio_sales_rep_1': job.xStudioSalesRep1,
      //   'x_studio_sales_source': job.xStudioSalesSource,
      //   'x_studio_commission_paid': job.xStudioCommissionPaid,
      //   'x_studio_referrer_processed': job.xStudioReferrerProcessed,
      //   'x_studio_payment_type': job.xStudioPaymentType,
      //   'amount_total': job.amountTotal,
      //   'amount_untaxed': job.taxTotals?.amountUntaxed,
      //   'delivery_status': job.deliveryStatus,
      //   'amount_to_invoice': job.amountToInvoice,
      //   'x_studio_invoice_payment_status': job.xStudioInvoicePaymentStatus,
      //   'internal_note_display': job.internalNoteDisplay,
      //   'state': job.state,
      //   // 'order_line': [],
      // };

      final response = await client.post<dynamic>(
        '$url/salesOrder',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
        data: {
          'amount_to_invoice': job.amountToInvoice,
          'amount_total': job.amountTotal,
          'amount_untaxed': job.taxTotals?.amountUntaxed,
          'create_date': job.createDate?.toIso8601String(),
          'delivery_status': job.deliveryStatus,
          'internal_note_display': job.internalNoteDisplay,
          'name': job.name,
          'partner_id_contact_address': job.partnerId?.contactAddress,
          'partner_id_display_name': job.partnerId?.displayName,
          'partner_id_phone': job.partnerId?.phone,
          'state': job.state,
          'x_studio_commission_paid': job.xStudioCommissionPaid == true ? 1 : 0,
          'x_studio_invoice_payment_status': job.xStudioInvoicePaymentStatus,
          'x_studio_payment_type': job.xStudioPaymentType,
          'x_studio_referrer_processed':
              job.xStudioReferrerProcessed == true ? 1 : 0,
          'x_studio_sales_rep_1': job.xStudioSalesRep1,
          'x_studio_sales_source': job.xStudioSalesSource,
          'order_line': job.orderLine != null
              ? job.orderLine!
                  .map(
                    (e) => {
                      'product': e.productTemplateId?.displayName ?? '',
                      'description': e.name,
                      'quantity': e.productUomQty,
                      'delivered': e.qtyDelivered,
                      'invoiced': e.qtyInvoiced,
                      'unit_price': e.priceUnit,
                      'taxes': (e.taxId?.isNotEmpty ?? false)
                          ? e.taxId![0].displayName
                          : '',
                      'disc': e.discount,
                      'tax_excl': e.priceSubtotal,
                    },
                  )
                  .toList()
              : [],
        },
      );

      var lala = response;
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
