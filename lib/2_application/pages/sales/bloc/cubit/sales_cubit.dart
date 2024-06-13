import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/0_data/odoo_repository.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
part 'sales_state.dart';

class SalesCubit extends Cubit<SalesCubitState> {
  SalesCubit({
    required this.odooRepo,
    required this.firestoreService,
    required this.repo,
  }) : super(const SalesStateLoading()) {
    fetchSales();
  }

  final OdooRepository odooRepo;
  final FirebaseFirestoreService firestoreService;
  final Repository repo;

  Future<void> fetchSales() async {
    emit(const SalesStateLoading());
    try {
      final data = await odooRepo.fetchSales();
      if (data != null) {
        print('totalllll ' + data.length.toString());
        var filteredData = data.where((e) => e.state == 'sale').toList();
        print('sales only :  ' + filteredData.toString());

        emit(SalesStateLoaded(filteredData));
      } else {
        emit(const SalesStateError(message: 'Sales Failed'));
      }
    } catch (e) {
      emit(SalesStateError(message: e.toString()));
    }
  }

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
      await firestoreService.saveLastUploadedTime(DateTime.now());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveAllSalesAws(
    List<SalesOrder> sales,
    void Function(double) onProgress,
  ) async {
    final totalSales = sales.length;
    var savedCount = 0;

    try {
      for (final sale in sales) {
        final success = await repo.saveSales(sale);
        print(success);
        savedCount++;
        final progress = (savedCount / totalSales) * 100;
        onProgress(progress); // Update progress callback
      }
      // await firestoreService.saveLastUploadedTime(DateTime.now());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> saveLandingPrice(List<LandingPrice> landingPrices) async {
    try {
      for (final price in landingPrices) {
        await firestoreService.saveLandingPrice(price);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
