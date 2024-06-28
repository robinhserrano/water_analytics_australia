// ignore_for_file: avoid_positional_boolean_parameters

import 'package:hive/hive.dart';
part 'sort_filter_hive_model.g.dart';

@HiveType(typeId: 1)
class SortFilterHive {
  SortFilterHive(
    this.selectedCommissionStatus,
    this.selectedInvoicePaymentStatus,
    this.selectedDeliverStatus,
    this.selectedSortValue,
    this.selectedNames,
    this.confirmedByManager,
  );
  @HiveField(0)
  final List<String> selectedCommissionStatus;

  @HiveField(1)
  final List<String> selectedInvoicePaymentStatus;

  @HiveField(2)
  final List<String> selectedDeliverStatus;

  @HiveField(3)
  final String selectedSortValue;

  @HiveField(4)
  final List<String> selectedNames;

  @HiveField(5)
  final bool confirmedByManager;
}
