// // part of 'sort_filter_cubit.dart';

// // abstract class SortFilterCubitState extends Equatable {
// //   const SortFilterCubitState({
// //     this.selectedCommissionStatus = const [],
// //     this.selectedInvoicePaymentStatus = const [],
// //     this.selectedDeliverStatus = const [],
// //   });

// //   final List<CommissionStatus> selectedCommissionStatus;
// //   final List<InvoicePaymentStatus> selectedInvoicePaymentStatus;
// //   final List<DeliveryStatus> selectedDeliverStatus;

// //   @override
// //   List<Object> get props => [
// //         selectedCommissionStatus,
// //         selectedInvoicePaymentStatus,
// //         selectedDeliverStatus,
// //       ];
// // }

// part of 'sort_filter_cubit.dart';

// class SortFilterCubitState extends Equatable {
//   const SortFilterCubitState(
//     this.selectedCommissionStatus,
//     this.selectedInvoicePaymentStatus,
//     this.selectedDeliverStatus,
//   );
//   final List<CommissionStatus> selectedCommissionStatus;
//   final List<InvoicePaymentStatus> selectedInvoicePaymentStatus;
//   final List<DeliveryStatus> selectedDeliverStatus;

//   @override
//   List<Object> get props => [
//         selectedCommissionStatus,
//         selectedInvoicePaymentStatus,
//         selectedDeliverStatus,
//       ];

//   SortFilterCubitState copyWith({
//     List<CommissionStatus>? selectedCommissionStatus,
//     List<InvoicePaymentStatus>? selectedInvoicePaymentStatus,
//     List<DeliveryStatus>? selectedDeliverStatus,
//   }) {
//     return SortFilterCubitState(
//       selectedCommissionStatus ?? this.selectedCommissionStatus,
//       selectedInvoicePaymentStatus ?? this.selectedInvoicePaymentStatus,
//       selectedDeliverStatus ?? this.selectedDeliverStatus,
//     );
//   }
// }

// // abstract class SortFilterCubitState extends Equatable {
// //   const SortFilterCubitState();

// //   @override
// //   List<Object> get props => [];
// // }

// // class SalesInitial extends SortFilterCubitState {
// //   const SalesInitial();
// // }

// // class SalesStateData extends SortFilterCubitState {
// //   const SalesStateData(
// //     this.selectedCommissionStatus,
// //     this.selectedInvoicePaymentStatus,
// //     this.selectedDeliverStatus,
// //   );
// //   final List<CommissionStatus> selectedCommissionStatus;
// //   final List<InvoicePaymentStatus> selectedInvoicePaymentStatus;
// //   final List<DeliveryStatus> selectedDeliverStatus;
// //   @override
// //   List<Object> get props => [
// //         selectedCommissionStatus,
// //         selectedInvoicePaymentStatus,
// //         selectedDeliverStatus,
// //       ];
// // }
