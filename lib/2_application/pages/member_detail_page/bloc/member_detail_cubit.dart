// ignore_for_file: avoid_positional_boolean_parameters

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
part 'member_detail_state.dart';

class MemberDetailCubit extends Cubit<MemberDetailCubitState> {
  MemberDetailCubit({
    required this.reps,
    required this.repo,
  }) : super(const MemberDetailStateLoading()) {
    fetchSales();
  }

  final List<String> reps;
  final Repository repo;

  Future<void> fetchSales() async {
    emit(const MemberDetailStateLoading());
    try {
      final users = await repo.fetchSalesByReps(reps);

      if (users != null) {
        emit(MemberDetailStateLoaded(users));
      } else {
        emit(const MemberDetailStateError(message: 'CloudSales Failed'));
      }
    } catch (e) {
      emit(MemberDetailStateError(message: e.toString()));
    }
  }

  Future<bool> updateUser(AwsUser user) async {
    try {
      await repo.updateUser(user);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateSalesLocal(
    List<AwsSalesOrder> salesOrders,
    AwsSalesOrder newSales,
  ) async {
    final index =
        salesOrders.indexWhere((salesOrder) => salesOrder.id == newSales.id);

    if (index != -1) {
      salesOrders[index] = newSales;
    } else {
      salesOrders.add(newSales);
    }

    emit(MemberDetailStateLoaded(salesOrders));
  }

  Future<bool> updateConfirmedBy(
    int userId,
    String name,
    bool confirmedByManager,
  ) async {
    try {
      final success =
          await repo.updateConfirmedBy(userId, name, confirmedByManager);

      return success;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateEnteredOdooBy(
    int userId,
    String name,
    bool isEnteredOdoo,
  ) async {
    try {
      final success =
          await repo.updateEnteredOdooBy(userId, name, isEnteredOdoo);

      return success;
    } catch (e) {
      return false;
    }
  }
}
