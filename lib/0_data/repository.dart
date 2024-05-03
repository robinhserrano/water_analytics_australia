// ignore_for_file: inference_failure_on_collection_literal

import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/1_domain/models/qoutation_record_model.dart';

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

  Future<List<QuotationRecord>?> fetchSales() async {
    final specification = {
      'name': {},
      'partner_id': {
        'fields': {
          'display_name': {},
        },
      },
      'amount_total': {},
      'amount_to_invoice': {},
      'date_order': {},
      'state': {},
      'currency_id': {
        'fields': {
          'display_name': {},
        },
      },
      'activity_state': {},
      'activity_ids': {'fields': {}},
      'activity_exception_decoration': {},
      'activity_exception_icon': {},
      'activity_summary': {},
      'activity_type_icon': {},
      'activity_type_id': {
        'fields': {
          'display_name': {},
        },
      },
    };

    final domain = [
      ['user_id', '=', 2],
    ];

    try {
      final response = await client.callKw({
        'model': 'sale.order',
        'method': 'web_search_read',
        'args': [domain, specification],
        'kwargs': {},
      });

      final data =
          ((response as Map<String, dynamic>)['records'] as List<dynamic>)
              .cast<Map<String, dynamic>>();
      final parsedData = data.map(QuotationRecord.fromJson).toList();

      return parsedData;
    } catch (e) {
      return null;
    }
  }
}
