import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
part 'sales_state.dart';

class SalesCubit extends Cubit<SalesCubitState> {
  SalesCubit({
    required this.repo,
    required this.firestoreService,
  }) : super(const SalesStateLoading()) {
    fetchSales();
  }

  final Repository repo;
  final FirebaseFirestoreService firestoreService;

  Future<void> fetchSales() async {
    emit(const SalesStateLoading());
    try {
      final data = await repo.fetchSales();
      if (data != null) {
        emit(SalesStateLoaded(data));
      } else {
        emit(const SalesStateError(message: 'Sales Failed'));
      }
    } catch (e) {
      emit(SalesStateError(message: e.toString()));
    }
  }

  // Future<bool> saveAllSales(List<SalesOrder> sales) async {
  //   try {
  //     for (final sale in sales) {
  //       await firestoreService.saveSales(sale);
  //     }
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  Future<bool> saveAllSales(
    List<SalesOrder> sales,
    void Function(double) onProgress,
  ) async {
    final totalSales = sales.length;
    var savedCount = 0;

    try {
      for (final sale in sales) {
        await firestoreService.saveSales(sale);
        savedCount++;
        final progress = (savedCount / totalSales) * 100;
        onProgress(progress); // Update progress callback
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
