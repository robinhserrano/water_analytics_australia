import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_sales_record_model.dart';
part 'cloud_sales_state.dart';

class CloudSalesCubit extends Cubit<CloudSalesCubitState> {
  CloudSalesCubit({required this.firestoreService})
      : super(const CloudSalesStateLoading()) {
    fetchCloudSales();
  }

  final FirebaseFirestoreService firestoreService;

  Future<void> fetchCloudSales() async {
    emit(const CloudSalesStateLoading());
    try {
      final data = await firestoreService.getSales();
      if (data != null) {
        emit(CloudSalesStateLoaded(data));
      } else {
        emit(const CloudSalesStateError(message: 'Sales Failed'));
      }
    } catch (e) {
      emit(CloudSalesStateError(message: e.toString()));
    }
  }
}
