import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
part 'sales_details_state.dart';

class SalesDetailsCubit extends Cubit<SalesDetailsCubitState> {
  SalesDetailsCubit({required this.repo})
      : super(const SalesDetailsStateLoading());

  final Repository repo;

  Future<void> fetchSalesDetails(String id) async {
    emit(const SalesDetailsStateLoading());
    try {
      final data = await repo.fetchSalesById(id);
      if (data != null) {
        emit(SalesDetailsStateLoaded(data));
      } else {
        emit(const SalesDetailsStateError(message: 'Sales Failed'));
      }
    } catch (e) {
      emit(SalesDetailsStateError(message: e.toString()));
    }
  }
}
