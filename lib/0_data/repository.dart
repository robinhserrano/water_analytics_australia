// ignore_for_file: inference_failure_on_collection_literal

import 'package:dio/dio.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';

class Repository {
  Repository({required this.client});
  final Dio client;

  // Future<OdooSession?> login(
  //   String dbName,
  //   String username,
  //   String password,
  // ) async {
  //   try {
  //     final response = await client.authenticate(dbName, username, password);
  //     return response;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  Future<bool> saveSales(
    SalesOrder job,
    //    {
    //   bool isConfirmedByManager = false,
    // }
  ) async {
    try {
      // final docRef = _firestore.collection(_salesOrderPath).doc(
      //       job.name.toString(),
      //     );

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
      // await docRef.set(data);

      // if (job.orderLine != null) {
      //   for (final order in job.orderLine!) {
      //     await saveOrderLine(job.name!, order);
      //   }
      // }

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<List<SalesOrder>?> fetchSales() async {
  //   final specification = {
  //     'name': {}, //A
  //     'create_date': {}, //B
  //     'partner_id': {
  //       //C-E
  //       'fields': {
  //         'display_name': {},
  //         'contact_address': {},
  //         'phone': {},
  //       },
  //     },
  //     'x_studio_sales_rep_1': {}, //F
  //     'x_studio_sales_source': {}, //G
  //     'x_studio_commission_paid': {}, //H
  //     'x_studio_referred_by': {
  //       'fields': {
  //         'display_name': {}, //I
  //       },
  //     },
  //     'x_studio_referrer_processed': {}, //J
  //     'x_studio_payment_type': {}, //K
  //     'amount_total': {}, //L
  //     'delivery_status': {}, //M
  //     'amount_to_invoice': {}, //N
  //     'x_studio_invoice_payment_status': {}, //O
  //     'internal_note_display': {}, //P
  //     'state': {},
  //     'user_id': {
  //       'fields': {
  //         'display_name': {},
  //       },
  //     },
  //     'team_id': {
  //       'fields': {
  //         'display_name': {},
  //       },
  //     },
  //     'tag_ids': {
  //       'fields': {
  //         'display_name': {},
  //       },
  //     },
  //     'order_line': {
  //       'fields': {
  //         'product_template_id': {
  //           'fields': {'display_name': {}},
  //         }, // a
  //         'name': {}, //b
  //         'product_uom_qty': {}, //c
  //         'qty_delivered': {}, //d
  //         'qty_invoiced': {}, //e
  //         'price_unit': {}, //f
  //         'tax_id': {
  //           //g
  //           'fields': {'display_name': {}},
  //         },
  //         'discount': {}, //h
  //         'price_subtotal': {}, //i
  //       },
  //     },
  //     'tax_totals': {},
  //   };

  //   final domain = [
  //     ['user_id', '=', 2],
  //   ];

  //   try {
  //     final response = await client.callKw({
  //       'model': 'sale.order',
  //       'method': 'web_search_read',
  //       'args': [
  //         [], // domain,
  //         specification,
  //       ],
  //       'kwargs': {},
  //     });

  //     final data =
  //         ((response as Map<String, dynamic>)['records'] as List<dynamic>)
  //             .cast<Map<String, dynamic>>();
  //     final parsedData = data.map(SalesOrder.fromJson).toList();

  //     final filteredData = parsedData
  //         .where(
  //           (element) =>
  //               element.tagIds?.any(
  //                 (element) => element.displayName == 'Retail System',
  //               ) ??
  //               false,
  //         )
  //         .toList();
  //     return filteredData;
  //   } on OdooSessionExpiredException catch (_) {
  //     final user = await HiveHelper.getAllUsers();
  //     if (user.isNotEmpty) {
  //       await client.authenticate(
  //         user.first.dbName!,
  //         user.first.userLogin!,
  //         user.first.password!,
  //       );
  //     }
  //     return null;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // Future<SalesOrder?> fetchSalesById(String id) async {
  //   final specification = {
  //     'name': {}, //A
  //     'create_date': {}, //B
  //     'partner_id': {
  //       //C-E
  //       'fields': {
  //         'display_name': {},
  //         'contact_address': {},
  //         'phone': {},
  //       },
  //     },
  //     'x_studio_sales_rep_1': {}, //F
  //     'x_studio_sales_source': {}, //G
  //     'x_studio_commission_paid': {}, //H
  //     'x_studio_referred_by': {
  //       'fields': {
  //         'display_name': {}, //I
  //       },
  //     },
  //     'x_studio_referrer_processed': {}, //J
  //     'x_studio_payment_type': {}, //K
  //     'amount_total': {}, //L
  //     'delivery_status': {}, //M
  //     'amount_to_invoice': {}, //N
  //     'x_studio_invoice_payment_status': {}, //O
  //     'internal_note_display': {}, //P
  //     'state': {},
  //     'user_id': {
  //       'fields': {
  //         'display_name': {},
  //       },
  //     },
  //     'team_id': {
  //       'fields': {
  //         'display_name': {},
  //       },
  //     },
  //     'tag_ids': {
  //       'fields': {
  //         'display_name': {},
  //       },
  //     },
  //     'order_line': {
  //       'fields': {
  //         'product_template_id': {
  //           'fields': {'display_name': {}},
  //         }, // a
  //         'name': {}, //b
  //         'product_uom_qty': {}, //c
  //         'qty_delivered': {}, //d
  //         'qty_invoiced': {}, //e
  //         'price_unit': {}, //f
  //         'tax_id': {
  //           //g
  //           'fields': {'display_name': {}},
  //         },
  //         'discount': {}, //h
  //         'price_subtotal': {}, //i
  //       },
  //     },
  //     'tax_totals': {},
  //   };

  //   try {
  //     final response = await client.callRPC(
  //       '/web/dataset/call_kw',
  //       'call',
  //       {
  //         'model': 'sale.order',
  //         'method': 'web_read',
  //         'args': [
  //           [int.parse(id)],
  //         ],
  //         'kwargs': {
  //           'specification': specification,
  //         },
  //       },
  //     );

  //     final data = (response as List<dynamic>).cast<Map<String, dynamic>>();
  //     final parsedData = data.map(SalesOrder.fromJson).toList();

  //     return parsedData.first;
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
