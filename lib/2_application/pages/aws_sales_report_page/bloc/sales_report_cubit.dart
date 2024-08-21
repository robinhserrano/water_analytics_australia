import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/0_data/odoo_repository.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';
part 'sales_report_state.dart';

class SalesReportCubit extends Cubit<SalesReportCubitState> {
  SalesReportCubit({
    // required this.odooRepo,
    // required this.firestoreService,
    required this.repo,
  }) : super(const SalesReportStateLoading()) {
    fetchSales();
  }

  // final OdooRepository odooRepo;
  // final FirebaseFirestoreService firestoreService;
  final Repository repo;

  Future<void> fetchSales(//List<String> seletectedNames
      ) async {
    emit(const SalesReportStateLoading());
    try {
      final user = await HiveHelper.getCurrentUser();

      List<AwsSalesOrder>? salesData;

      // //ACCESS RESTRICTION
      if (user?.accessLevel == 1) {
        salesData = await repo.fetchSalesByReps([user?.displayName ?? '']);
      } else if (user?.accessLevel == 2 || user?.accessLevel == 3) {
        final users = await repo.fetchUsers();
        final userNames = users.map((e) => e.displayName).toList();
        salesData = await repo.fetchSalesByReps(userNames);
      } else {
        //var salesDatas = await repo.fetchSalesPaginated(50, 1);
        salesData = await repo.fetchSales();
      }

      final landingPriceData = await repo.fetchLandingPrices();
      var users = <AwsUser>[];
      if ((user?.accessLevel ?? 1) > 1) {
        users = await repo.fetchUsers();
      }

      if (salesData != null && landingPriceData != null) {
        print('totalllll ' + salesData.length.toString());
        final filteredsalesData =
            salesData.where((e) => e.state == 'sale').toList();
        print('sales only :  ' + filteredsalesData.toString());

        emit(
          SalesReportStateLoaded(filteredsalesData, landingPriceData, users),
        );
      } else {
        emit(const SalesReportStateError(message: 'Sales Failed'));
      }
    } catch (e) {
      emit(SalesReportStateError(message: e.toString()));
    }
  }
}
