// ignore_for_file: inference_failure_on_collection_literal

import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';

class Repository {
  Repository({required this.client});
  final Dio client;
  static String url = 'http://3.27.69.251';
  static String token1 = '1|uNKKybwei0tpPyD5hj9yvnEM6xwQhp7GOskCcHocd9171b40';

  Future<String?> fetchAccessToken(String email, String password) async {
    try {
      final response = await client.post<String>(
        '$url/api/sanctum/token',
        queryParameters: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<AwsSalesOrder>?> fetchSales() async {
    final user = await HiveHelper.getAllUsers();
    try {
      final response = await client.get<List<dynamic>>(
        '$url/api/salesOrder',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      final data = response.data!.cast<Map<String, dynamic>>();
      final parsedData = data.map(AwsSalesOrder.fromJson).toList();

      return parsedData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AwsSalesOrder?> fetchSalesById(String id) async {
    final user = await HiveHelper.getAllUsers();
    try {
      final response = await client.get<Map<String, dynamic>>(
        '$url/api/salesOrder/$id',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      final parsedData = AwsSalesOrder.fromJson(response.data!);

      return parsedData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> saveSales(
    SalesOrder job,
    //    {
    //   bool isConfirmedByManager = false,
    // }
  ) async {
    try {
      final user = await HiveHelper.getAllUsers();
      client.interceptors.add(ChuckerDioInterceptor());
      // final docRef = _firestore.collection(_salesOrderPath).doc(
      //       job.name.toString(),
      //     );
      //staging
      //const url = 'http://54.227.19.30'; //prod

      // Replace 'YOUR_BEARER_TOKEN' with your actual bearer token

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
        '$url/api/salesOrder',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
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

  Future<bool> saveAllSalesBulk(
    List<SalesOrder> salesOrders,
  ) async {
    try {
      client.interceptors.add(ChuckerDioInterceptor());
      const url = 'http://3.27.69.251';
      const token = '1|uNKKybwei0tpPyD5hj9yvnEM6xwQhp7GOskCcHocd9171b40';

      final dataList = <Map<String, dynamic>>[];
      for (final salesOrder in salesOrders) {
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

      final response = await client.post<dynamic>(
        '$url/api/salesOrder',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
        data: dataList,
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
