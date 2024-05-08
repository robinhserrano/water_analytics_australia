// ignore_for_file: inference_failure_on_collection_literal

import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';

class Repository {
  Repository({required this.client});
  final OdooClient client;

  Future<OdooSession?> login(
    String dbName,
    String username,
    String password,
  ) async {
    try {
      final response = await client.authenticate(dbName, username, password);
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<List<SalesOrder>?> fetchSales() async {
    // final specification = {
    //   'name': {},
    //   'partner_id': {
    //     'fields': {
    //       'display_name': {},
    //     },
    //   },
    //   'amount_total': {},
    //   'amount_to_invoice': {},
    //   'date_order': {},
    //   'state': {},
    //   'currency_id': {
    //     'fields': {
    //       'display_name': {},
    //     },
    //   },
    //   'activity_state': {},
    //   'activity_ids': {'fields': {}},
    //   'activity_exception_decoration': {},
    //   'activity_exception_icon': {},
    //   'activity_summary': {},
    //   'activity_type_icon': {},
    //   'activity_type_id': {
    //     'fields': {
    //       'display_name': {},
    //     },
    //   },
    // };
    final specification = {
      'name': {}, //A
      'create_date': {}, //B
      'partner_id': {
        //C-E
        'fields': {
          'display_name': {},
          'contact_address': {},
          'phone': {},
        },
      },
      'x_studio_sales_rep_1': {}, //F
      'x_studio_sales_source': {}, //G
      'x_studio_commission_paid': {}, //H
      'x_studio_referred_by': {
        'fields': {
          'display_name': {}, //I
        },
      },
      'x_studio_referrer_processed': {}, //J
      'x_studio_payment_type': {}, //K
      'amount_total': {}, //L
      'delivery_status': {}, //M
      'amount_to_invoice': {}, //N
      'x_studio_invoice_payment_status': {}, //O
      'internal_note_display': {}, //P
      'state': {},
      'user_id': {
        'fields': {
          'display_name': {},
        },
      },
      // 'order_line': {
      //   'fields': {
      //     'product_template_id': {
      //       'fields': {'display_name': {}},
      //     }, // a
      //     'name': {}, //b
      //     'product_uom_qty': {}, //c
      //     'qty_delivered': {}, //d
      //     'qty_invoiced': {}, //e
      //     'price_unit': {}, //f
      //     'tax_id': {
      //       //g
      //       'fields': {'display_name': {}},
      //     },
      //     'discount': {}, //h
      //     'price_subtotal': {}, //i
      //   },
      // },
    };

    final domain = [
      ['user_id', '=', 2],
    ];

    try {
      final response = await client.callKw({
        'model': 'sale.order',
        'method': 'web_search_read',
        'args': [
          domain,
          specification,
        ],
        'kwargs': {},
      });

      final data =
          ((response as Map<String, dynamic>)['records'] as List<dynamic>)
              .cast<Map<String, dynamic>>();
      final parsedData = data.map(SalesOrder.fromJson).toList();

      return parsedData;
    } catch (e) {
      return null;
    }
  }

  Future<SalesOrder?> fetchSalesById(String id) async {
    final specification = {
      'name': {}, //A
      'create_date': {}, //B
      'partner_id': {
        //C-E
        'fields': {
          'display_name': {},
          'contact_address': {},
          'phone': {},
        },
      },
      'x_studio_sales_rep_1': {}, //F
      'x_studio_sales_source': {}, //G
      'x_studio_commission_paid': {}, //H
      'x_studio_referred_by': {
        'fields': {
          'display_name': {}, //I
        },
      },
      'x_studio_referrer_processed': {}, //J
      'x_studio_payment_type': {}, //K
      'amount_total': {}, //L
      'delivery_status': {}, //M
      'amount_to_invoice': {}, //N
      'x_studio_invoice_payment_status': {}, //O
      'internal_note_display': {}, //P
      'state': {},
      'user_id': {
        'fields': {
          'display_name': {},
        },
      },
      'order_line': {
        'fields': {
          'product_template_id': {
            'fields': {'display_name': {}},
          }, // a
          'name': {}, //b
          'product_uom_qty': {}, //c
          'qty_delivered': {}, //d
          'qty_invoiced': {}, //e
          'price_unit': {}, //f
          'tax_id': {
            //g
            'fields': {'display_name': {}},
          },
          'discount': {}, //h
          'price_subtotal': {}, //i
        },
      },
    };

    try {
      final response = await client.callRPC(
        '/web/dataset/call_kw',
        'call',
        {
          'model': 'sale.order',
          'method': 'web_read',
          'args': [
            [int.parse(id)],
          ],
          'kwargs': {
            'specification': specification,
          },
        },
      );

      final data = (response as List<dynamic>).cast<Map<String, dynamic>>();
      final parsedData = data.map(SalesOrder.fromJson).toList();

      return parsedData.first;
    } catch (e) {
      return null;
    }
  }
}
