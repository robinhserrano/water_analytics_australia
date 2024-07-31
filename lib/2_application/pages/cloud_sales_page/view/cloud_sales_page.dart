// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls, prefer_int_literals, avoid_positional_boolean_parameters, avoid_web_libraries_in_flutter
// import 'dart:html' as html;
import 'dart:typed_data';
import 'package:data_table_2/data_table_2.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:water_analytics_australia/0_data/data/hive/sort_filter_hive_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_sales_record_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/widgets/aws_sort_filter_modal.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_details/view/cloud_sales_details_page.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/cubit/cloud_sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/sales/widgets/sort_filter_modal.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/widgets/home_end_drawer.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class CloudSalesPageWrapperProvider extends StatelessWidget {
  const CloudSalesPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CloudSalesCubit>(),
      child: CloudSalesPage(
        client: sl<OdooClient>(),
      ),
    );
  }
}

class CloudSalesPage extends StatefulWidget {
  const CloudSalesPage({required this.client, super.key});

  static const name = 'sales';
  static const path = '/sales';

  final OdooClient client;

  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  static void closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  static void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  State<CloudSalesPage> createState() => _CloudSalesPageState();
}

class _CloudSalesPageState extends State<CloudSalesPage> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//  final ctrlSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: CloudSalesPage._scaffoldKey,
      drawer: SortFilterModal(
        onChanged: () => setState(() {}),
      ),
      endDrawer: const HomeEndDrawer(),
      backgroundColor: const Color(0xfff9fafb), // Colors.blueGrey.shade50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black, //(0xff0083ff),
        title: const Text(
          'Sales Quotation - Firebase',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                CloudSalesPage._scaffoldKey.currentState!.openEndDrawer(),
            icon: const HeroIcon(
              HeroIcons.bars3,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () => context.read<CloudSalesCubit>().fetchCloudSales(),
        child: BlocBuilder<CloudSalesCubit, CloudSalesCubitState>(
          builder: (context, state) {
            if (state is CloudSalesStateLoading) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: ShimmerBox(
                    height: 110,
                  ),
                ),
              );
            } else if (state is CloudSalesStateLoaded) {
              return FutureBuilder<Box<SortFilterHive>>(
                future: Hive.openBox<SortFilterHive>('sortFilter'),
                builder: (context, snapshot) {
                  SortFilterHive? sortFilterData;

                  try {
                    sortFilterData = snapshot.data?.values.first;
                  } catch (e) {
                    sortFilterData = null;
                  }

                  if (sortFilterData != null) {
                    final commissionStatus =
                        sortFilterData.selectedCommissionStatus;
                    final invoicePaymentStatus =
                        sortFilterData.selectedInvoicePaymentStatus;
                    final deliverStatus = sortFilterData.selectedDeliverStatus;

                    final filteredRecords = state.records
                        .where(
                          (record) =>
                              (!commissionStatus.any(
                                (status) =>
                                    status !=
                                    record.xStudioCommissionPaid.toString(),
                              )) &&
                              (!invoicePaymentStatus.any(
                                (status) =>
                                    status !=
                                    record.xStudioInvoicePaymentStatus
                                        .toString(),
                              )) &&
                              (!deliverStatus.any(
                                (status) =>
                                    status != record.deliveryStatus.toString(),
                              )),
                        )
                        .toList();

                    final selectedSortValue = sortFilterData.selectedSortValue;
                    if (selectedSortValue == 'Newest') {
                      filteredRecords.sort(
                        (a, b) => b.createDate!.compareTo(a.createDate!),
                      );
                    }
                    if (selectedSortValue == 'Oldest') {
                      filteredRecords.sort(
                        (a, b) => a.createDate!.compareTo(b.createDate!),
                      );
                    }
                    if (selectedSortValue == 'A-Z') {
                      filteredRecords.sort(
                        (a, b) => (a.partnerIdDisplayName ?? '')
                            .toLowerCase()
                            .compareTo(
                              (b.partnerIdDisplayName ?? '').toLowerCase(),
                            ),
                      );
                    }
                    if (selectedSortValue == 'Z-A') {
                      filteredRecords.sort(
                        (a, b) => (b.partnerIdDisplayName ?? '')
                            .toLowerCase()
                            .compareTo(
                              (a.partnerIdDisplayName ?? '').toLowerCase(),
                            ),
                      );
                    }
                    return SalesListPageLoaded(
                      records: filteredRecords,
                    );
                  }
                  return SalesListPageLoaded(
                    records: state.records,
                  );
                },
              );
              //return SalesListPageLoaded(records: state.records);
            } else if (state is CloudSalesStateError) {
              return SalesListPageError(
                onRefresh: () =>
                    context.read<CloudSalesCubit>().fetchCloudSales(),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class SalesListPageLoaded extends StatefulWidget {
  const SalesListPageLoaded({required this.records, super.key});

  final List<CloudSalesOrder> records;

  @override
  State<SalesListPageLoaded> createState() => _SalesListPageLoadedState();
}

class _SalesListPageLoadedState extends State<SalesListPageLoaded> {
  final ctrlSearch = TextEditingController();
  int _rowsPerPage = 10;
  Set<String> selectedSalesNo = {};

  void updateSelectedSaleNo(String salesNo, bool isSelected) {
    if (isSelected) {
      setState(() {
        selectedSalesNo.add(salesNo);
      });
    } else {
      setState(() {
        selectedSalesNo.removeWhere((e) => e == salesNo);
      });
    }
  }

  Widget searchBox() {
    return Container(
      width: ResponsiveValue(
        context,
        conditionalValues: [
          const Condition.smallerThan(name: TABLET, value: 240.0),
          const Condition.equals(name: TABLET, value: 240.0),
          const Condition.largerThan(name: TABLET, value: 600.0),
        ],
      ).value,
      decoration: const BoxDecoration(
        color: Color(0xffeeeef0),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: TextFormField(
        controller: ctrlSearch,
        enableSuggestions: false,
        autocorrect: false,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelStyle: TextStyle(color: Colors.green),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Color(0xff5f5f60),
            fontWeight: FontWeight.w400,
          ),
        ),
        onChanged: (value) {
          setState(() {});
        },
        onEditingComplete: () {},
        onFieldSubmitted: (value) {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var records = widget.records;

    if (ctrlSearch.text.trim().isNotEmpty) {
      records = records
          .where(
            (e) =>
                (e.name?.toLowerCase() ?? '')
                    .contains(ctrlSearch.text.toLowerCase()) ||
                (e.partnerIdDisplayName?.toLowerCase() ?? '')
                    .contains(ctrlSearch.text.toLowerCase()),
          )
          .toList();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: records.isEmpty
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    searchBox(),
                    const IconButton(
                      onPressed: CloudSalesPage.openDrawer,
                      icon: HeroIcon(
                        HeroIcons.adjustmentsHorizontal,
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: Center(
                    child: Text('No sales yet.'),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    searchBox(),
                    const IconButton(
                      onPressed: CloudSalesPage.openDrawer,
                      icon: HeroIcon(
                        HeroIcons.adjustmentsHorizontal,
                      ),
                    ),
                    if (selectedSalesNo.isNotEmpty) ...[
                      ElevatedButton.icon(
                        icon: const Icon(FontAwesomeIcons.fileExcel),
                        onPressed: () {
                          // _downloadExcel(
                          //   selectedSalesNo,
                          //   records,
                          // );
                        },
                        label: const Text('Export as Excel File'),
                      ),
                    ],
                  ],
                ),
                Expanded(
                  child: PaginatedDataTable2(
                    availableRowsPerPage: const [2, 5, 10, 15, 20, 30, 50, 100],
                    rowsPerPage: _rowsPerPage,
                    onRowsPerPageChanged: (value) {
                      setState(() {
                        if (value != null) {
                          _rowsPerPage = value;
                        }
                      });
                    },
                    minWidth: 1200,
                    columns: const [
                      DataColumn(label: Text('Number')),
                      DataColumn(label: Text('Order Date')),
                      DataColumn(label: Text('Customer')),
                      DataColumn(label: Text('Sales Rep')),
                      DataColumn(label: Text('Sales Source')),
                      DataColumn(label: Text('Commission Paid')),
                      DataColumn(label: Text('Total')),
                      DataColumn(label: Text('Delivery Status')),
                      // DataColumn(label: Text('Final Commission')),
                      // DataColumn(label: Text('Confirmed by Manager')),
                    ],
                    source: MyDataTableSource(
                      records,
                      context,
                      updateSelectedSaleNo,
                      selectedSalesNo,
                    ),
                    onSelectAll: (value) {
                      if (selectedSalesNo.isNotEmpty) {
                        setState(() {
                          selectedSalesNo.clear();
                        });
                      } else {
                        setState(() {
                          selectedSalesNo.addAll(
                            widget.records.map((e) => e.name ?? '').toList(),
                          );
                        });
                      }
                    },
                  ),
                ),
                // Expanded(
                //   child: Scrollbar(
                //     child: ListView.builder(
                //       itemCount: state.records.length,
                //       itemBuilder: (context, index) {
                //         final record = state.records[index];
                //         if ((record.name?.toLowerCase() ?? '')
                //                 .contains(
                //               ctrlSearch.text.toLowerCase(),
                //             ) ||
                //             (record.partnerIdDisplayName ?? '')
                //                 .toLowerCase()
                //                 .contains(
                //                   ctrlSearch.text.toLowerCase(),
                //                 )) {
                //           return CloudSalesRecordCard(
                //             record: record,
                //           );
                //         }

                //         return const SizedBox();
                //       },
                //     ),
                //   ),
                // ),
                // {
              ],
            ),
    );
  }
}

class SalesListPageError extends StatelessWidget {
  const SalesListPageError({
    required this.onRefresh,
    super.key,
  });
  final void Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Something went wrong',
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: onRefresh,
            child: const Text('Refresh'),
          ),
        ],
      ),
    );
  }
}

class MyDataTableSource extends DataTableSource {
  MyDataTableSource(
    this.data,
    this.context,
    this.updateSelectedSaleNo,
    this.selectedSalesNo,
  );
  final List<CloudSalesOrder> data;
  final BuildContext context;
  void Function(String salesNo, bool isSelected) updateSelectedSaleNo;
  Set<String> selectedSalesNo = {};

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  DataRow getRow(int index) {
    if (index >= rowCount || index < 0) {
      throw Exception('Invalid row index');
    }
    final item = data[index];

    return DataRow.byIndex(
      onSelectChanged: (value) {
        updateSelectedSaleNo(item.name ?? '', value ?? false);
      },
      selected: selectedSalesNo.contains(item.name ?? ''),
      index: index,
      cells: [
        DataCell(
          onTap: () => onTap(item),
          Text(
            item.name ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff374151),
            ),
          ),
        ),
        DataCell(
          onTap: () => onTap(item),
          Text(
            item.createDate == null
                ? ''
                : DateFormat('MM/dd/yy').format(item.createDate!),
          ),
        ),
        DataCell(
          onTap: () => onTap(item),
          Text(item.partnerIdDisplayName ?? ''),
        ),
        DataCell(onTap: () => onTap(item), Text(item.xStudioSalesRep1 ?? '')),
        DataCell(onTap: () => onTap(item), Text(item.xStudioSalesSource ?? '')),
        DataCell(
          onTap: () => onTap(item),
          Checkbox(
            onChanged: null, //(value) {},
            value: item.xStudioCommissionPaid,
          ),
        ),
        DataCell(
          onTap: () => onTap(item),
          Text(
            formatCurrency(item.amountTotal ?? 0),
          ),
        ),
        DataCell(
          onTap: () => onTap(item),
          Text(
            (item.deliveryStatus ?? '').toString() == 'full'
                ? 'Fully Delivered'
                : (item.deliveryStatus ?? '').toString() == 'partial'
                    ? 'Partially Delivered'
                    : 'Not Delivered',
          ),
        ),
        // DataCell(
        //   onTap: () => onTap(item),
        //   Text(
        //     r'$' +
        //         calculateFinalCommission(item, item.orderLines ?? [])
        //             .toStringAsFixed(2),
        //   ),
        // ),
        // DataCell(
        //   onTap: () => onTap(item),
        //   Checkbox(
        //     onChanged: null, //(value) {},
        //     value: item.confirmedByManager != null &&
        //         !(item.confirmedByManager?.isConfirmed == false),
        //   ),
        // ),
        // DataCell(
        //   onTap: () => onTap(item),
        //   Text(
        //     formatCurrency(item.amountTotal ?? 0),
        //   ),
        // ),
      ],
    );
  }

  void onTap(CloudSalesOrder item) {
    context.pushNamed(
      CloudSalesDetailsPage.name,
      pathParameters: {'id': item.id.toString()},
    );
  }

  @override
  int get selectedRowCount => selectedSalesNo.length;
}

// void _downloadExcel(
//   Set<String> selectedSalesNo,
//   List<CloudSalesOrder> records,
// ) {
//   final excel = Excel.createExcel();
//   final filteredRecords =
//       records.where((e) => selectedSalesNo.contains(e.name)).toList();

//   final sheetObject = excel['Sheet1']
//     ..appendRow([
//       const TextCellValue('Number'),
//       const TextCellValue('Order Date'),
//       const TextCellValue('Customer'),
//       const TextCellValue('Sales Rep'),
//       const TextCellValue('Sales Source'),
//       const TextCellValue('Commission Paid'),
//       const TextCellValue('Total'),
//       const TextCellValue('Delivery Status'),
//       const TextCellValue('Final Commission'),
//       const TextCellValue('Confirmed by Manager'),
//     ]);

//   for (final item in filteredRecords) {
//     sheetObject.appendRow([
//       TextCellValue(
//         item.name ?? '',
//       ),
//       TextCellValue(
//         item.createDate == null
//             ? ''
//             : DateFormat('MM/dd/yy').format(item.createDate!),
//       ),
//       TextCellValue(item.partnerIdDisplayName ?? ''),
//       TextCellValue(item.xStudioSalesRep1 ?? ''),
//       TextCellValue(item.xStudioSalesSource ?? ''),
//       TextCellValue(item.xStudioCommissionPaid.toString()),
//       DoubleCellValue(item.amountTotal ?? 0),
//       TextCellValue(
//         (item.deliveryStatus ?? '').toString() == 'full'
//             ? 'Fully Delivered'
//             : (item.deliveryStatus ?? '').toString() == 'partial'
//                 ? 'Partially Delivered'
//                 : 'Not Delivered',
//       ),
//       DoubleCellValue(
//         calculateFinalCommission(item, item.orderLines ?? []),
//       ),
//       TextCellValue(false.toString()),
//     ]);
//   }

//   // // Append data rows
//   // sheetObject.appendRow([
//   //   CellValue.string('John Doe'),
//   //   CellValue.int(30),
//   //   CellValue.string('USA'),
//   // ]);
//   // sheetObject.appendRow([
//   //   CellValue.string('Alice Smith'),
//   //   CellValue.int(25),
//   //   CellValue.string('Canada'),
//   // ]);

//   // Save the Excel file
//   final excelBytes = excel.encode() ?? [];
//   final blob = html.Blob([Uint8List.fromList(excelBytes)]);
//   final url = html.Url.createObjectUrlFromBlob(blob);

//   // Create a link element and click it to download the file
//   final anchor = html.AnchorElement(href: url)
//     ..setAttribute(
//       'download',
//       '${DateFormat('MM-dd-yy').format(DateTime.now())}'
//           ' Sales Commission.xlsx',
//     )
//     ..click();

//   // Revoke the object URL to free up resources
//   html.Url.revokeObjectUrl(url);
// }
