import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/0_data/odoo_repository.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
part 'aws_sales_details_state.dart';

class AwsSalesDetailsCubit extends Cubit<AwsSalesDetailsCubitState> {
  AwsSalesDetailsCubit({
    required this.odooRepo,
    required this.firestoreService,
    required this.repo,
  }) : super(const AwsSalesDetailsStateLoading());

  final OdooRepository odooRepo;
  final FirebaseFirestoreService firestoreService;
  final Repository repo;

  Future<void> fetchAwsSalesDetails(String id) async {
    emit(const AwsSalesDetailsStateLoading());
    try {
      final data = await repo.fetchSalesById(id);
      if (data != null) {
        emit(AwsSalesDetailsStateLoaded(data));
      } else {
        emit(const AwsSalesDetailsStateError(message: 'Sales Failed'));
      }
    } catch (e) {
      emit(AwsSalesDetailsStateError(message: e.toString()));
    }
  }

  Future<bool> saveSales(SalesOrder sale) async {
    try {
      await firestoreService.saveSales(sale);
      await firestoreService.saveLastUploadedTime(DateTime.now());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveSalesAws(SalesOrder sale) async {
    try {
      final success = await repo.saveSales(sale);
      //await firestoreService.saveLastUploadedTime(DateTime.now());

      return success;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateSalesOrder(AwsSalesOrder order) async {
    try {
      final success = await repo.updateSalesOrder(order);

      return success;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateManualAddition(
    int userId,
    String name,
    String manualNotes,
    double additionalDeduction,
  ) async {
    try {
      final success = await repo.updateManualAddition(
        userId,
        name,
        manualNotes,
        additionalDeduction,
      );

      return success;
    } catch (e) {
      return false;
    }
  }

  // ignore: avoid_positional_boolean_parameters
  Future<bool> updateConfirmedBy(
      int userId, String name, bool confirmedByManager) async {
    try {
      final success =
          await repo.updateConfirmedBy(userId, name, confirmedByManager);

      return success;
    } catch (e) {
      return false;
    }
  }

  // Future<bool> saveAdditionalDeduction(AwsSalesOrder order) async {
  //   try {
  //     final success = true; //await repo.saveSales(sale);
  //     //await firestoreService.saveLastUploadedTime(DateTime.now());

  //     return success;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // Future<bool> saveConfirmedByManager(AwsSalesOrder order) async {
  //   try {
  //     final success =
  //         await repo.saveConfirmedByManager(id, additionalDeduction);
  //     //await firestoreService.saveLastUploadedTime(DateTime.now());

  //     return success;
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
