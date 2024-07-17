// ignore_for_file: inference_failure_on_collection_literal

import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';

class Repository {
  Repository({required this.client});
  final Dio client;
  static String url = 'https://commission.wateranalytics.com.au/api';
  //static String {user.first.accessToken} = '4|z69CydNH6KEshKdKz83m0bbFiYXywU69puknFigf47720c26';

  Future<String?> fetchAccessToken(String email, String password) async {
    try {
      final response = await client.post<String>(
        '$url/sanctum/token',
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
        '$url/salesOrder',
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

  Future<List<AwsSalesOrder>?> fetchSalesByReps(
    List<String> selectedNames,
  ) async {
    final user = await HiveHelper.getAllUsers();

    final encodedReps = selectedNames
        .map((rep) => 'reps[]=${Uri.encodeComponent(rep)}')
        .toList();
    final queryString = encodedReps.join('&');
    try {
      final response = await client.get<List<dynamic>>(
        '$url/getSalesByReps?$queryString',
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
        '$url/salesOrder/$id',
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
      final response = await client.post<dynamic>(
        '$url/salesOrder',
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
      final user = await HiveHelper.getAllUsers();

      client.interceptors.add(ChuckerDioInterceptor());

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
        '$url/bulkStore',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
        data: dataList,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<AwsUser>?> fetchUsers() async {
    final user = await HiveHelper.getCurrentUser();
    try {
      final response = await client.get<List<dynamic>>(
        '$url/users',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user!.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      final data = response.data!.cast<Map<String, dynamic>>();
      final parsedData = data.map(AwsUser.fromJson).toList();
      // var hehe = parsedData.where((e) => e.salesManagerId == user.first.userId);
      // var hihi = hehe ;

      if (user.accessLevel == 2 || user.accessLevel == 3) {
        final salesTeamManager = parsedData
            .where(
              (e) => e.salesManagerId == user.userId && e.accessLevel == 2,
            )
            .toList();

        final managers = [
          ...salesTeamManager.map((e) => e.id),
          user.userId,
        ];

        final salesPerson = parsedData
            .where(
              (e) => managers.contains(e.salesManagerId),
            )
            .toList();

        final currentUser = parsedData.firstWhere(
          (e) => e.id == user.userId,
        );

        return [currentUser, ...salesTeamManager, ...salesPerson]
            .toSet()
            .toList();
      }
      return parsedData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AwsUser?> fetchUserById(String id) async {
    final user = await HiveHelper.getAllUsers();
    try {
      final response = await client.get<Map<String, dynamic>>(
        '$url/users/$id',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      final parsedData = AwsUser.fromJson(response.data!);

      return parsedData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AwsUser?> fetchUser(
    String email,
    String password,
    String accessToken,
  ) async {
    try {
      final response = await client.get<Map<String, dynamic>>(
        '$url/user',
        queryParameters: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $accessToken',
          },
        ),
      );
      final parsedData = AwsUser.fromJson(response.data!);

      return parsedData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> updateUser(AwsUser awsUser) async {
    final user = await HiveHelper.getAllUsers();
    try {
      // final data = <String, dynamic>{
      //   'name': awsUser.displayName,
      //   'email': awsUser.email,
      //   'access_level': awsUser.accessLevel,
      //   'commission_split': awsUser.commissionSplit,
      //   'sales_manager_id': awsUser.salesManagerId,
      // };

      final response = await client.patch<Map<String, dynamic>>(
        '$url/users/${awsUser.id}',
        data: awsUser.toJson(),
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      // final parsedData = AwsUser.fromJson(response.data!);

      // return parsedData;
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateUserPassword(int userId, String password) async {
    final user = await HiveHelper.getAllUsers();
    try {
      final response = await client.post<Map<String, dynamic>>(
        '$url/updatePassword',
        data: {
          'id': userId,
          'password': password,
        },
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      // final parsedData = AwsUser.fromJson(response.data!);

      // return parsedData;
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> createUser(AwsUser awsUser) async {
    final user = await HiveHelper.getAllUsers();
    try {
      final data = <String, dynamic>{
        'name': awsUser.displayName,
        'email': awsUser.email,
        'access_level': awsUser.accessLevel,
        'commission_split': awsUser.commissionSplit,
        'sales_manager_id': awsUser.salesManagerId,
        'password': 'p455w0rd',
      };

      final response = await client.post<Map<String, dynamic>>(
        '$url/users',
        data: data,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      // final parsedData = AwsUser.fromJson(response.data!);

      // return parsedData;
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateSalesOrder(AwsSalesOrder salesOrder) async {
    final user = await HiveHelper.getAllUsers();
    try {
      final response = await client.patch<Map<String, dynamic>>(
        '$url/salesOrder/${salesOrder.id}',
        data: salesOrder.toJson(),
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      // final parsedData = AwsUser.fromJson(response.data!);

      // return parsedData;
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateManualAddition(
    int userId,
    String name,
    String manualNotes,
    double additionalDeduction,
  ) async {
    final user = await HiveHelper.getAllUsers();
    try {
      final response = await client.post<Map<String, dynamic>>(
        '$url/updateManualAddition',
        data: {
          'user_id': userId,
          'name': name,
          'manual_notes': manualNotes,
          'additional_deduction': additionalDeduction,
        },
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      // final parsedData = AwsUser.fromJson(response.data!);

      // return parsedData;
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> updateConfirmedBy(
      int userId, String name, bool confirmedByManager) async {
    final user = await HiveHelper.getAllUsers();
    try {
      final response = await client.post<Map<String, dynamic>>(
        '$url/updateConfirmedBy',
        data: {
          'user_id': userId,
          'name': name,
          'confirmed_by_manager': confirmedByManager,
        },
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      // final parsedData = AwsUser.fromJson(response.data!);

      // return parsedData;
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<PaginatedAwsSalesOrder?> fetchSalesPaginated(
    int perPage,
    int page,
  ) async {
    final user = await HiveHelper.getAllUsers();
    try {
      final response = await client.get<Map<String, dynamic>>(
        '$url/getPaginatedSalesOrders',
        queryParameters: {
          'page': page,
          'per_page': perPage,
        },
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      final parsedData = PaginatedAwsSalesOrder.fromJson(response.data!);

      return parsedData;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> updateEnteredOdooBy(
      int userId, String name, bool isEnteredOdoo) async {
    final user = await HiveHelper.getAllUsers();
    try {
      final response = await client.post<Map<String, dynamic>>(
        '$url/updateEnteredOdooBy',
        data: {
          'user_id': userId,
          'name': name,
          'is_entered_odoo': isEnteredOdoo,
        },
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
      );

      // final parsedData = AwsUser.fromJson(response.data!);

      // return parsedData;
      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

//Fix this 7/17
  Future<bool> saveLandingPrice(
    LandingPrice landingPrice,
  ) async {
    try {
      final user = await HiveHelper.getAllUsers();
      client.interceptors.add(ChuckerDioInterceptor());
      final response = await client.post<dynamic>(
        '$url/landingPrice',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ${user.first.accessToken}',
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          },
        ),
        data: {
          'name': landingPrice.name,
          'internal_reference': landingPrice.internalReference,
          'product_category': landingPrice.productCategory,
          'installation_service': landingPrice.installationService,
          'supply_only': landingPrice.supplyOnly,
        },
      );
      
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
