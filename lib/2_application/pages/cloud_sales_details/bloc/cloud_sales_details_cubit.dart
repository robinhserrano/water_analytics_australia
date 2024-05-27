import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_analytics_australia/0_data/firebase_repository.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_sales_record_model.dart';
part 'cloud_sales_details_state.dart';

class CloudSalesDetailsCubit extends Cubit<CloudSalesDetailsCubitState> {
  CloudSalesDetailsCubit({
    required this.firestoreService,
  }) : super(const CloudSalesDetailsStateLoading());

  final FirebaseFirestoreService firestoreService;

  Future<void> fetchCloudSalesDetails(String id) async {
    emit(const CloudSalesDetailsStateLoading());
    try {
      final saleOrder = await firestoreService.getSaleById(id);
      final orderLine = await firestoreService.getOrderLinesById(id);
      if (saleOrder != null) {
        emit(CloudSalesDetailsStateLoaded(saleOrder, orderLine ?? []));
      } else {
        emit(const CloudSalesDetailsStateError(message: 'CloudSales Failed'));
      }
    } catch (e) {
      emit(CloudSalesDetailsStateError(message: e.toString()));
    }
  }

  // Future<bool> saveCloudSales(CloudSalesOrder sale) async {
  //   try {
  //     await firestoreService.saveCloudSales(sale);

  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
