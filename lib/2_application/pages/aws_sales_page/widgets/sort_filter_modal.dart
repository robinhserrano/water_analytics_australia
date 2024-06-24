// ignore_for_file: inference_failure_on_function_return_type, avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:water_analytics_australia/0_data/data/hive/sort_filter_hive_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/sort_filter_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/view/aws_sales_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/widgets/pick_users_modal.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/view/cloud_sales_page.dart';
import 'package:water_analytics_australia/2_application/pages/sales/view/sales_page.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';

class SortFilterModal extends StatefulWidget {
  const SortFilterModal({
    required this.onChanged,
    super.key,
  });

  final void Function() onChanged;

  @override
  State<SortFilterModal> createState() => _SortFilterModalState();
}

class _SortFilterModalState extends State<SortFilterModal> {
  SortBy selectedSortValue = SortBy.newestFirst;
  List<CommissionStatus> selectedCommissionStatus = [];
  List<InvoicePaymentStatus> selectedInvoicePaymentStatus = [];
  List<DeliveryStatus> selectedDeliverStatus = [];
  bool commissionPayableActive = false;
  List<String> selectedNames = [];
  int accessLevel = 0;

  @override
  void initState() {
    final userBox = Hive.box<SortFilterHive>('sortFilter');
    if (userBox.values.isNotEmpty) {
      selectedCommissionStatus = convertStringsToCommissionStatuses(
        userBox.values.first.selectedCommissionStatus,
      );
      selectedInvoicePaymentStatus = convertStringsToInvoicePaymentStatuses(
        userBox.values.first.selectedInvoicePaymentStatus,
      );
      selectedDeliverStatus = convertStringsToDeliveryStatuses(
        userBox.values.first.selectedDeliverStatus,
      );

      selectedSortValue =
          convertStringToSortBy(userBox.values.first.selectedSortValue);
      selectedNames = userBox.values.first.selectedNames;
    }
    _getUserFromHive();

    super.initState();
  }

  Future<void> _getUserFromHive() async {
    final user = await HiveHelper.getCurrentUser();
    accessLevel = user?.accessLevel ?? 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomSheet: ColoredBox(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      bottom: 8,
                      top: 8,
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        final sortFilterBox =
                            Hive.box<SortFilterHive>('sortFilter');
                        await sortFilterBox.clear();
                        widget.onChanged();
                        SalesPage.closeDrawer();
                        CloudSalesPage.closeDrawer();
                        AwsSalesPage.closeDrawer();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xffFFFFFF),
                        side: const BorderSide(
                          color: Color(0xffD0D5DD),
                        ),
                      ),
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          color: Color(0xff344054),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      bottom: 8,
                      top: 8,
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        final sortFilterBox =
                            Hive.box<SortFilterHive>('sortFilter');
                        await sortFilterBox.clear();
                        await sortFilterBox.add(
                          SortFilterHive(
                            convertCommissionStatusesToStrings(
                              selectedCommissionStatus,
                            ),
                            convertInvoicePaymentStatusesToStrings(
                              selectedInvoicePaymentStatus,
                            ),
                            convertDeliveryStatusesToStrings(
                              selectedDeliverStatus,
                            ),
                            selectedSortValue.name,
                            selectedNames,
                          ),
                        );

                        widget.onChanged();
                        SalesPage.closeDrawer();
                        CloudSalesPage.closeDrawer();
                        AwsSalesPage.closeDrawer();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xff475467),
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                'Sort & Filter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  SalesPage.closeDrawer();
                  CloudSalesPage.closeDrawer();
                  AwsSalesPage.closeDrawer();
                },
                child: const Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ],
          ),
          body: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Divider(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  'Sort by',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Column(
                children: SortBy.values.map((sortBy) {
                  return SizedBox(
                    height: 35,
                    child: RadioListTile<SortBy>(
                      title: Text(
                        sortBy.name,
                        style: const TextStyle(color: Color(0xff243242)),
                      ),
                      value: sortBy,
                      groupValue: selectedSortValue,
                      onChanged: (selected) {
                        setState(() {
                          selectedSortValue = selected ?? SortBy.newestFirst;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 16,
                ),
                child: Divider(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  'Quick Action (Shortcuts)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Checkbox(
                      value: commissionPayableActive,
                      onChanged: (value) {
                        if (value == false) {
                          setState(() {
                            commissionPayableActive = false;
                          });
                        } else {
                          setState(() {
                            commissionPayableActive = true;
                            selectedCommissionStatus
                              ..clear()
                              ..add(
                                CommissionStatus.notPaid,
                              );
                            selectedInvoicePaymentStatus
                              ..clear()
                              ..add(
                                InvoicePaymentStatus.full,
                              );

                            selectedDeliverStatus
                              ..clear()
                              ..add(
                                DeliveryStatus.full,
                              );
                          });
                        }
                      },
                    ),
                    const Text(
                      'Payable Commissions',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff243242),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Divider(),
              ),
              //ACCESS RESTRICTION
              if (accessLevel >= 2) ...[
                //FIX THIS 6/24
                const Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text(
                    'Filter By Users',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Users ' '(${selectedNames.length})',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final data = await showPickUsers(
                                context,
                                selectedNames,
                              ) ??
                              [];
                          setState(() {
                            selectedNames = data;
                          });
                        },
                        child: const Text('Select'),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: Divider(),
                ),
              ],
              CommissionStatusCheckList(
                selectedCommissionStatus: selectedCommissionStatus,
                onChanged: (newValue, status) {
                  if (newValue) {
                    setState(() {
                      selectedCommissionStatus.add(status);
                    });
                  } else {
                    setState(() {
                      selectedCommissionStatus.remove(status);
                    });
                  }
                },
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Divider(),
              ),
              InvoicePaymentStatusCheckList(
                selectedInvoicePaymentStatus: selectedInvoicePaymentStatus,
                onChanged: (newValue, status) {
                  if (newValue) {
                    setState(() {
                      selectedInvoicePaymentStatus.add(status);
                    });
                  } else {
                    setState(() {
                      selectedInvoicePaymentStatus.remove(status);
                    });
                  }
                },
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Divider(),
              ),
              DeliveryStatusCheckList(
                selectedDeliverStatus: selectedDeliverStatus,
                onChanged: (newValue, status) {
                  if (newValue) {
                    setState(() {
                      selectedDeliverStatus.add(status);
                    });
                  } else {
                    setState(() {
                      selectedDeliverStatus.remove(status);
                    });
                  }
                },
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckBoxTile extends StatelessWidget {
  const CustomCheckBoxTile({
    required this.title,
    required this.value,
    required this.onChanged,
    super.key,
  });
  final String title;
  final bool value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Color(0xff243242)),
          ),
        ],
      ),
    );
  }
}

class CommissionStatusCheckList extends StatelessWidget {
  const CommissionStatusCheckList({
    required this.selectedCommissionStatus,
    required this.onChanged,
    super.key,
  });
  final List<CommissionStatus> selectedCommissionStatus;
  final Function(bool, CommissionStatus status) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Commission Status',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        ...CommissionStatus.values.map(
          (status) => CustomCheckBoxTile(
            title: status.name,
            value: selectedCommissionStatus.contains(status),
            onChanged: (newValue) {
              onChanged(newValue ?? false, status);
            },
          ),
        ),
      ],
    );
  }
}

class InvoicePaymentStatusCheckList extends StatelessWidget {
  const InvoicePaymentStatusCheckList({
    required this.selectedInvoicePaymentStatus,
    required this.onChanged,
    super.key,
  });
  final List<InvoicePaymentStatus> selectedInvoicePaymentStatus;
  final Function(bool, InvoicePaymentStatus status) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Invoice Payment Status',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        ...InvoicePaymentStatus.values.map(
          (status) => CustomCheckBoxTile(
            title: status.name,
            value: selectedInvoicePaymentStatus.contains(status),
            onChanged: (newValue) {
              onChanged(newValue ?? false, status);
            },
          ),
        ),
      ],
    );
  }
}

class DeliveryStatusCheckList extends StatelessWidget {
  const DeliveryStatusCheckList({
    required this.selectedDeliverStatus,
    required this.onChanged,
    super.key,
  });
  final List<DeliveryStatus> selectedDeliverStatus;
  final Function(bool, DeliveryStatus status) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Delivery Status',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        ...DeliveryStatus.values.map(
          (status) => CustomCheckBoxTile(
            title: status.name,
            value: selectedDeliverStatus.contains(status),
            onChanged: (newValue) {
              onChanged(newValue ?? false, status);
            },
          ),
        ),
      ],
    );
  }
}
