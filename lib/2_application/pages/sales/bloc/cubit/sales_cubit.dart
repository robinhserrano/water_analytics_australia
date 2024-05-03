import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/qoutation_record_model.dart';
part 'sales_state.dart';

class SalesCubit extends Cubit<SalesCubitState> {
  SalesCubit({required this.repo}) : super(const SalesStateLoading()) {
    fetchSales();
  }

  final Repository repo;

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
}
