import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/0_data/odoo_repository.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
part 'sales_details_state.dart';

class SalesDetailsCubit extends Cubit<SalesDetailsCubitState> {
  SalesDetailsCubit({
    required this.odooRepo,
    required this.firestoreService,
    required this.repo,
  }) : super(const SalesDetailsStateLoading());

  final OdooRepository odooRepo;
  final FirebaseFirestoreService firestoreService;
  final Repository repo;

  Future<void> fetchSalesDetails(String id) async {
    emit(const SalesDetailsStateLoading());
    try {
      final data = await odooRepo.fetchSalesById(id);
      if (data != null) {
        emit(SalesDetailsStateLoaded(data));
      } else {
        emit(const SalesDetailsStateError(message: 'Sales Failed'));
      }
    } catch (e) {
      emit(SalesDetailsStateError(message: e.toString()));
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
}
