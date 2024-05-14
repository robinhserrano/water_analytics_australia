// ignore_for_file: avoid_positional_boolean_parameters

import 'package:hive/hive.dart';
import 'package:water_analytics_australia/1_domain/models/sort_filter_model.dart';

part 'sort_filter_hive_model.g.dart';

@HiveType(typeId: 1)
class SortFilterHive {
  SortFilterHive(
    this.selectedCommissionStatus,
    this.selectedInvoicePaymentStatus,
    this.selectedDeliverStatus,
  );
  @HiveField(0)
  final List<CommissionStatus> selectedCommissionStatus;

  @HiveField(1)
  final List<InvoicePaymentStatus> selectedInvoicePaymentStatus;

  @HiveField(2)
  final List<DeliveryStatus> selectedDeliverStatus;
}
