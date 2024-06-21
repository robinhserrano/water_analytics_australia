// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls, unused_import, prefer_int_literals

import 'dart:html' as html;
import 'dart:io';

import 'package:data_table_2/data_table_2.dart';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:water_analytics_australia/0_data/data/hive/sort_filter_hive_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_detail_page/view/aws_sales_details_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/bloc/aws_sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/widgets/sales_record_card.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/widgets/sort_filter_modal.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/widgets/sync_users_modal.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_details/view/cloud_sales_details_page.dart';
import 'package:water_analytics_australia/2_application/pages/sales/bloc/cubit/sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/sales/widgets/sort_filter_modal.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/temp.dart';
import 'package:water_analytics_australia/core/widgets/home_end_drawer.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class AwsSalesPageWrapperProvider extends StatelessWidget {
  const AwsSalesPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AwsSalesCubit>(),
      child: const AwsSalesPage(),
    );
  }
}

class AwsSalesPage extends StatefulWidget {
  const AwsSalesPage({super.key});

  static const name = 'awsSales';
  static const path = '/awsSales';

  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  static void closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  static void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  State<AwsSalesPage> createState() => _AwsSalesPageState();
}

class _AwsSalesPageState extends State<AwsSalesPage> {
  int number = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _initHive() async {
    // final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    // Hive.init(appDocumentDir.path);
    // await Hive.openBox<MyData>('myBox'); // Change 'myBox' to your actual box name
    // _dataBox = Hive.box<MyData>('myBox');
    setState(() {}); // Update the widget once data is loaded
  }


  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AwsSalesCubit>();

    return Scaffold(
      key: AwsSalesPage._scaffoldKey,
      endDrawer: const HomeEndDrawer(),
      drawer: SortFilterModal(
        onChanged: () => setState(() {}),
      ),
      backgroundColor: const Color(0xfff9fafb),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'Sales Quotation - AWS',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                AwsSalesPage._scaffoldKey.currentState!.openEndDrawer(),
            icon: const HeroIcon(
              HeroIcons.bars3,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () => context.read<AwsSalesCubit>().fetchSales(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: BlocBuilder<AwsSalesCubit, AwsSalesCubitState>(
            builder: (context, state) {
              if (state is AwsSalesStateLoading) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: ShimmerBox(
                      height: 110,
                    ),
                  ),
                );
              } else if (state is AwsSalesStateLoaded) {
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
                      final deliverStatus =
                          sortFilterData.selectedDeliverStatus;

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
                                      status !=
                                      record.deliveryStatus.toString(),
                                )),
                          )
                          .toList();

                      final selectedSortValue =
                          sortFilterData.selectedSortValue;
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
              } else if (state is AwsSalesStateError) {
                return SalesListPageError(
                  onRefresh: () => context.read<AwsSalesCubit>().fetchSales(),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class SalesListPageLoaded extends StatefulWidget {
  const SalesListPageLoaded({required this.records, super.key});

  final List<AwsSalesOrder> records;

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

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AwsSalesCubit>();

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
                      onPressed: AwsSalesPage.openDrawer,
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
                      onPressed: AwsSalesPage.openDrawer,
                      icon: HeroIcon(
                        HeroIcons.adjustmentsHorizontal,
                      ),
                    ),
                    if (kIsWeb && selectedSalesNo.isNotEmpty) ...[
                      ElevatedButton.icon(
                        icon: const Icon(FontAwesomeIcons.fileExcel),
                        onPressed: () {
                          _downloadExcelWeb(
                            selectedSalesNo,
                            records,
                          );
                        },
                        label: const Text('Export'),
                      ),
                    ],
                    // ElevatedButton.icon(
                    //   icon: const Icon(FontAwesomeIcons.users),
                    //   onPressed: () {
                    //     showSyncUsers(context, widget.records, cubit);
                    //   },
                    //   label: const Text('Sync Users'),
                    // ),
                  ],
                ),
                Expanded(
                  child: PaginatedDataTable2(
                    availableRowsPerPage: const [2, 5, 10, 15, 20, 30, 50],
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
                      DataColumn(label: Text('Final Commission')),
                      DataColumn(label: Text('Confirmed by Manager')),
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
                //           return AwsSalesRecordCard(
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

// class SalesListPageLoaded extends StatefulWidget {
//   const SalesListPageLoaded({required this.records, super.key});

//   final List<AwsSalesOrder> records;

//   @override
//   State<SalesListPageLoaded> createState() => _SalesListPageLoadedState();
// }

// class _SalesListPageLoadedState extends State<SalesListPageLoaded> {
//   final ctrlSearch = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xfff9fafb),
//       body: widget.records.isEmpty
//           ? const Center(
//               child: Text('No sales yet.'),
//             )
//           : Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           color: Color(0xffeeeef0),
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                         ),
//                         margin: const EdgeInsets.only(
//                           left: 16,
//                           top: 8,
//                           bottom: 8,
//                         ),
//                         child: TextFormField(
//                           controller: ctrlSearch,
//                           enableSuggestions: false,
//                           autocorrect: false,
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             labelStyle: TextStyle(color: Colors.green),
//                             hintText: 'Search',
//                             hintStyle: TextStyle(
//                               color: Color(0xff5f5f60),
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           onChanged: (value) {
//                             setState(() {});
//                           },
//                           onEditingComplete: () {},
//                           onFieldSubmitted: (value) {},
//                         ),
//                       ),
//                     ),
//                     const IconButton(
//                       onPressed: AwsSalesPage.openDrawer,
//                       icon: HeroIcon(
//                         HeroIcons.adjustmentsHorizontal,
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         _downloadExcelWeb(widget.records);
//                       },
//                       icon: HeroIcon(
//                         HeroIcons.arrowDown,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Text(widget.records.length.toString()),
//                 Expanded(
//                   child: Scrollbar(
//                     child: ListView.builder(
//                       itemCount: widget.records.length,
//                       itemBuilder: (context, index) {
//                         final record = widget.records[index];
//                         if ((record.name?.toLowerCase() ?? '').contains(
//                               ctrlSearch.text.toLowerCase(),
//                             ) ||
//                             (record.partnerIdDisplayName ?? '')
//                                 .toLowerCase()
//                                 .contains(
//                                   ctrlSearch.text.toLowerCase(),
//                                 )) {
//                           return SalesRecordCard(
//                             record: record,
//                           );
//                         }

//                         return const SizedBox();
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }

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

Future<void> _downloadExcelWeb(
  Set<String> selectedSalesNo,
  List<AwsSalesOrder> records,
) async {
  final excel = Excel.createExcel();
  final filteredRecords = records;
  //records.where((e) => selectedSalesNo.contains(e.name)).toList();

  final sheetObject = excel['Sheet1']
    ..appendRow([
      const TextCellValue('Number'),
      const TextCellValue('Order Date'),
      const TextCellValue('Customer'),
      const TextCellValue('Sales Rep'),
      const TextCellValue('Sales Source'),
      const TextCellValue('Commission Paid'),
      const TextCellValue('Total'),
      const TextCellValue('Delivery Status'),
      const TextCellValue('Final Commission'),
      const TextCellValue('Confirmed by Manager'),
    ]);

  for (final item in filteredRecords) {
    sheetObject.appendRow([
      TextCellValue(
        item.name ?? '',
      ),
      TextCellValue(
        item.createDate == null
            ? ''
            : DateFormat('MM/dd/yyyy hh:mm a').format(item.createDate!),
      ),
      TextCellValue(item.partnerIdDisplayName ?? ''),
      TextCellValue(item.xStudioSalesRep1 ?? ''),
      TextCellValue(item.xStudioSalesSource ?? ''),
      TextCellValue(item.xStudioCommissionPaid.toString()),
      DoubleCellValue(item.amountTotal ?? 0),
      TextCellValue(
        (item.deliveryStatus ?? '').toString() == 'full'
            ? 'Fully Delivered'
            : (item.deliveryStatus ?? '').toString() == 'partial'
                ? 'Partially Delivered'
                : 'Not Delivered',
      ),
      DoubleCellValue(
        calculateFinalCommission(
          item,
          item.orderLine != null
              ? item.orderLine!
                  .map(
                    (e) => AwsOrderLine(
                      id: null,
                      product: e.product,
                      description: e.description,
                      quantity: e.quantity,
                      delivered: e.delivered,
                      invoiced: e.invoiced,
                      unitPrice: e.unitPrice,
                      taxes: e.taxes,
                      disc: e.disc,
                      taxExcl: e.taxExcl,
                    ),
                  )
                  .toList()
              : [],
        ),
      ),
      TextCellValue(item.confirmedByManager.toString()),
    ]);
  }

  // // Append data rows
  // sheetObject.appendRow([
  //   CellValue.string('John Doe'),
  //   CellValue.int(30),
  //   CellValue.string('USA'),
  // ]);
  // sheetObject.appendRow([
  //   CellValue.string('Alice Smith'),
  //   CellValue.int(25),
  //   CellValue.string('Canada'),
  // ]);

  var fileName = 'my_data.xlsx';
  var bytes = excel.save(fileName: fileName);

  // Get the appropriate directory based on platform
  // var directory = await getExternalStorageDirectory();
  var directory2 = await getExternalStorageDirectory();
  var filePath = join(directory2!.path, fileName);

  // Write the file bytes to the chosen location
  try {
    print(filePath);
    await File(filePath).writeAsBytes(bytes!);
    print('success');
  } catch (e) {
    print(e);
  }

  // // Save the Excel file
  // final excelBytes = excel.encode() ?? [];
  // final blob = html.Blob([Uint8List.fromList(excelBytes)]);
  // final url = html.Url.createObjectUrlFromBlob(blob);

  // // Create a link element and click it to download the file
  // final anchor = html.AnchorElement(href: url)
  //   ..setAttribute(
  //     'download',
  //     '${DateFormat('MM-dd-yyyy').format(DateTime.now())}'
  //         ' Sales Commission.xlsx',
  //   )
  //   ..click();

  // // Revoke the object URL to free up resources
  // html.Url.revokeObjectUrl(url);
}

class MyDataTableSource extends DataTableSource {
  MyDataTableSource(
    this.data,
    this.context,
    this.updateSelectedSaleNo,
    this.selectedSalesNo,
  );
  final List<AwsSalesOrder> data;
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
                : DateFormat('MM/dd/yyyy hh:mm a').format(item.createDate!),
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
        DataCell(
          onTap: () => onTap(item),
          Text(
            r'$' +
                calculateFinalCommission(item, item.orderLine ?? [])
                    .toStringAsFixed(2),
          ),
        ),
        DataCell(
          onTap: () => onTap(item),
          Checkbox(
            onChanged: null, //(value) {},
            value: item.confirmedByManager,
            // value: item.confirmedByManager != null &&
            //     !(item.confirmedByManager?.isConfirmed == false),
          ),
        ),
        // DataCell(
        //   onTap: () => onTap(item),
        //   Text(
        //     formatCurrency(item.amountTotal ?? 0),
        //   ),
        // ),
      ],
    );
  }

  void onTap(AwsSalesOrder item) {
    context.pushNamed(
      AwsSalesDetailsPage.name,
      pathParameters: {'id': item.id.toString()},
    );
  }

  @override
  int get selectedRowCount => selectedSalesNo.length;
}

// void _downloadExcelWeb(
//   Set<String> selectedSalesNo,
//   List<AwsSalesOrder> records,
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
//             : DateFormat('MM/dd/yyyy hh:mm a').format(item.createDate!),
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
//         calculateFinalCommission(item, item.orderLine ?? []),
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
//       '${DateFormat('MM-dd-yyyy').format(DateTime.now())}'
//           ' Sales Commission.xlsx',
//     )
//     ..click();

//   // Revoke the object URL to free up resources
//   html.Url.revokeObjectUrl(url);
//   print('hjerkjrklewjrklwejrl');
// }

double calculateFinalCommission(
  AwsSalesOrder order,
  List<AwsOrderLine> orderLine,
) {
  final sellingPrice = calculateCashPrice(
    order.amountTotal ?? 0,
    (order.xStudioPaymentType ?? '').toLowerCase().contains('cash'),
  );

  final additionalCost = order.additionalDeduction != null
      ? order.additionalDeduction ?? 0
      : getAwsAdditionalCost(orderLine, landingPrices).fold(
          0.0,
          (prev, e) => prev + (e.unitPrice ?? 0),
        );
  final landingPrice = getLandingPrice(orderLine, landingPrices).fold(
    0.0,
    (prev, e) =>
        prev +
        (e.isSupplyOnly
            ? (e.landingPrice.supplyOnly ?? 0.0)
            : (e.landingPrice.installationService ?? 0.0)),
  );
  final temp = (sellingPrice - additionalCost) - landingPrice;

  final extraCommission = temp <= 0
      ? temp
      : temp *
          ((order.user?.commissionSplit?.toDouble() ?? 50) / 100); //FIX THIS

  final baseCommission = (orderLine.any(
    (element) => (element.product ?? '').contains(
      'USRO-6S1-2W'.toLowerCase(),
    ),
  ))
      ? 200
      : (order.xStudioSalesSource ?? '').toLowerCase().contains('self')
          ? 1000
          : 500;
  final finalCommission = extraCommission + baseCommission;

  return finalCommission;
}

List<AwsOrderLine> getAwsAdditionalCost(
  List<AwsOrderLine> orderLines,
  List<LandingPrice> landingPrices,
) {
  final matchingLandingPrices = <LandingPriceWithQuantity>{};
  final isSupplyOnly = orderLines.any(
    (orderLine) => orderLine.product?.toLowerCase() == 'supply only',
  );
  final additionalCostSet = <AwsOrderLine>{};
  final tempAdditionalCostSet = <AwsOrderLine>{};
  for (final orderLine in orderLines) {
    final displayName = orderLine.product;
    final quantity = orderLine.quantity ?? 0;
    if (displayName != null) {
      for (final landingPrice in landingPrices) {
        if (displayName
            .toLowerCase()
            .contains(landingPrice.internalReference!.toLowerCase())) {
          matchingLandingPrices.add(
            LandingPriceWithQuantity(
              landingPrice: landingPrice,
              quantity: quantity.toDouble(),
              isSupplyOnly: isSupplyOnly,
            ),
          );

          break;
        } else {
          additionalCostSet.add(orderLine);
        }
      }
    }
  }

  for (final item in additionalCostSet) {
    final displayName = item.product ?? '';
    for (final landingPrice in landingPrices) {
      if (displayName
          .toLowerCase()
          .contains(landingPrice.internalReference!.toLowerCase())) {
        tempAdditionalCostSet.add(
          item,
        );

        break;
      }
    }
  }

  additionalCostSet
      .retainWhere((element) => !tempAdditionalCostSet.contains(element));

  final additionalCostList = additionalCostSet.toList()
    ..removeWhere(
      (item) =>
          ((item.product ?? '')
              .toLowerCase()
              .contains('installation service')) ||
          (item.product ?? '').toLowerCase().contains('supply only'),
    );
  return additionalCostList;
}

double calculateCashPrice(
  double salesOrderTotal,
  bool isCash,
) {
  if (isCash) {
    return salesOrderTotal;
  } else {
    return salesOrderTotal * 0.9;
  }
}

List<LandingPriceWithQuantity> getLandingPrice(
  List<AwsOrderLine> orderLines,
  List<LandingPrice> landingPrices,
) {
  final matchingLandingPrices = <LandingPriceWithQuantity>{};
  final isSupplyOnly = orderLines.any(
    (orderLine) => orderLine.product?.toLowerCase() == 'supply only',
  );

  for (final orderLine in orderLines) {
    final displayName = orderLine.product;
    final quantity = orderLine.quantity;
    if (displayName != null && quantity != null) {
      for (final landingPrice in landingPrices) {
        if (displayName
            .toLowerCase()
            .contains(landingPrice.internalReference!.toLowerCase())) {
          matchingLandingPrices.add(
            LandingPriceWithQuantity(
              landingPrice: (quantity >= 2 &&
                      landingPrice.internalReference == 'USRO-3S1-2W' &&
                      !isSupplyOnly)
                  ? landingPrice.copyWith(installationService: 790)
                  : landingPrice,
              quantity: quantity.toDouble(),
              isSupplyOnly: isSupplyOnly,
            ),
          );

          break;
        }
      }
    }
  }

  return matchingLandingPrices.toList();
}
