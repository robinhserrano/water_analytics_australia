// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:water_analytics_australia/1_domain/models/sort_filter_model.dart';
// part 'sort_filter_state.dart';

// // class SortFilterCubit extends Cubit<SortFilterCubitState> {
// //   SortFilterCubit() : super(const SalesInitial());

// //   void updateSelectedStatuses({
// //     List<CommissionStatus>? selectedCommissionStatus,
// //     List<InvoicePaymentStatus>? selectedInvoicePaymentStatus,
// //     List<DeliveryStatus>? selectedDeliverStatus,
// //   }) {
// //     emit(
// //       state.
// //       SalesStateData(
// //         selectedCommissionStatus ?? [],
// //         selectedInvoicePaymentStatus ?? [],
// //         selectedDeliverStatus ?? [],
// //       ),
// //     );
// //   }
// // }

// class SortFilterCubit extends Cubit<SortFilterCubitState> {
//   SortFilterCubit(super.initialState);

//   void updateCommissionStatus(List<CommissionStatus> selectedStatus) {
//     emit(state.copyWith(selectedCommissionStatus: selectedStatus));
//   }

//   void updateInvoicePaymentStatus(List<InvoicePaymentStatus> selectedStatus) {
//     emit(state.copyWith(selectedInvoicePaymentStatus: selectedStatus));
//   }

//   void updateDeliveryStatus(List<DeliveryStatus> selectedStatus) {
//     emit(state.copyWith(selectedDeliverStatus: selectedStatus));
//   }
// }
