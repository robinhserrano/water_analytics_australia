// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls, unused_import, prefer_int_literals

import 'dart:async';
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
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/sort_filter_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_detail_page/view/aws_sales_details_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/bloc/aws_sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/widgets/member_sort_filter.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/widgets/sales_record_card.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/widgets/aws_sort_filter_modal.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/widgets/sync_users_modal.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_details/view/cloud_sales_details_page.dart';
import 'package:water_analytics_australia/2_application/pages/home_page.dart';
import 'package:water_analytics_australia/2_application/pages/member_detail_page/bloc/member_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/sales/bloc/cubit/sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/sales/widgets/sort_filter_modal.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';
import 'package:water_analytics_australia/core/temp.dart';
import 'package:water_analytics_australia/core/widgets/home_end_drawer.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class MemberDetailPageWrapperProvider extends StatelessWidget {
  const MemberDetailPageWrapperProvider({required this.rep, super.key});

  final String rep;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemberDetailCubit(
        reps: [rep],
        repo: sl<Repository>(),
      ),
      child: MemberDetailPage(
        rep: rep,
      ),
    );
  }
}

class MemberDetailPage extends StatefulWidget {
  const MemberDetailPage({required this.rep, super.key});

  final String rep;

  static const name = 'memberDetail';
  static const path = '/memberDetail/:rep';

  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  static void closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  static void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  State<MemberDetailPage> createState() => _MemberDetailPageState();
}

class _MemberDetailPageState extends State<MemberDetailPage> {
  int userAccessLevel = 1;
  int currentUserId = 0;
  int number = 0;

  @override
  void initState() {
    _getUserFromHive();
    super.initState();
  }

  Future<void> _getUserFromHive() async {
    final user = await HiveHelper.getCurrentUser();
    userAccessLevel = user?.accessLevel ?? 1;
    currentUserId = user?.userId ?? 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: MemberDetailPage._scaffoldKey,
      endDrawer: const HomeEndDrawer(),
      drawer: SortFilterModal(
        onChanged: () => setState(() {}),
      ),
      backgroundColor: const Color(0xfff9fafb),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text(
          "${widget.rep.endsWith('s') ? widget.rep : '${widget.rep}s'}' Sales",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            if (context.canPop()) return context.pop();
            context.pushNamed(HomePage.name);
          },
        ),
        actions: [
          // IconButton(
          //   onPressed: MemberDetailPage.openDrawer,
          //   icon: const HeroIcon(
          //     HeroIcons.bars3,
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () => context.read<MemberDetailCubit>().fetchSales(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: BlocBuilder<MemberDetailCubit, MemberDetailCubitState>(
            builder: (context, state) {
              if (state is MemberDetailStateLoading) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: ShimmerBox(
                      height: 110,
                    ),
                  ),
                );
              } else if (state is MemberDetailStateLoaded) {
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
                      final selectedNames = sortFilterData.selectedNames;
                      final confirmedByManager =
                          sortFilterData.confirmedByManager;
                      final selectedSortValue =
                          sortFilterData.selectedSortValue;

                      //Sort Records via SortBy
                      var sortedRecords = sortRecords(
                        selectedSortValue,
                        state.records,
                      );

                      //Filter records via Chosen SalesRep
                      if (selectedNames.isNotEmpty) {
                        sortedRecords = sortedRecords
                            .where(
                              (e) => selectedNames.any(
                                (name) =>
                                    name.toLowerCase() ==
                                    e.xStudioSalesRep1?.toLowerCase(),
                              ),
                            )
                            .toList();
                      }

                      //Filter Records via CommissionStatus,
                      //InvoicePaymentStatus, DeliveryStatus
                      var filteredRecords = filterRecords(
                        sortedRecords,
                        commissionStatus: commissionStatus.toSet(),
                        invoicePaymentStatus: invoicePaymentStatus.toSet(),
                        deliverStatus: deliverStatus.toSet(),
                      );

                      final total = commissionStatus.length +
                          invoicePaymentStatus.length +
                          deliverStatus.length;

                      var isPayableCommission = false;
                      if (commissionStatus.isNotEmpty &&
                          invoicePaymentStatus.isNotEmpty &&
                          deliverStatus.isNotEmpty) {
                        if (commissionStatus[0] == 'false' &&
                            invoicePaymentStatus[0] == 'paid' &&
                            deliverStatus[0] == 'full' &&
                            total == 3) {
                          isPayableCommission = true;
                        }
                      }

                      if (confirmedByManager) {
                        filteredRecords = filteredRecords
                            .where(
                              (record) => record.confirmedByManager == true,
                            )
                            .toList();
                      }

                      if (isPayableCommission) {
                        filteredRecords = filteredRecords
                            .where(
                              (record) =>
                                  record.user?.selfGen != 0 &&
                                  record.user?.companyLead != 0,
                            )
                            .toList();
                      }

                      return MemberDetailLoaded(
                        records: filteredRecords,
                        userAccessLevel: userAccessLevel,
                        currentUserId: currentUserId,
                      );
                    }

                    final defaultSortRecords = state.records
                      ..sort(
                        (a, b) => b.createDate!.compareTo(a.createDate!),
                      );
                    return MemberDetailLoaded(
                      records: defaultSortRecords,
                      userAccessLevel: userAccessLevel,
                      currentUserId: currentUserId,
                    );
                  },
                );
              } else if (state is MemberDetailStateError) {
                return MemberDetailError(
                  onRefresh: () =>
                      context.read<MemberDetailCubit>().fetchSales(),
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

class MemberDetailLoaded extends StatefulWidget {
  const MemberDetailLoaded({
    required this.records,
    required this.userAccessLevel,
    required this.currentUserId,
    super.key,
  });

  final List<AwsSalesOrder> records;
  final int userAccessLevel;
  final int currentUserId;

  @override
  State<MemberDetailLoaded> createState() => _MemberDetailLoadedState();
}

class _MemberDetailLoadedState extends State<MemberDetailLoaded> {
  final ctrlSearch = TextEditingController();
  int _rowsPerPage = 50;
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
    final cubit = context.read<MemberDetailCubit>();

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
                      onPressed: MemberDetailPage.openDrawer,
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
                      onPressed: MemberDetailPage.openDrawer,
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
                if (findLatestAwsSalesOrder(widget.records) != null) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Last Synced: ${DateFormat('MM/dd/yyyy').format(findLatestAwsSalesOrder(widget.records)!.toLocal())}',
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],

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
                    columnSpacing: 4,
                    minWidth: 1500,
                    columns: const [
                      DataColumn2(
                        label: Expanded(
                          child: Text(
                            'Number',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        size: ColumnSize.S,
                      ),
                      DataColumn2(
                        label: Expanded(
                          child: Text(
                            'Order Date',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        size: ColumnSize.S,
                      ),
                      DataColumn2(
                        label: Expanded(
                          child: Text(
                            'Customer',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      DataColumn2(
                        label: Expanded(
                          child: Text(
                            'Sales Rep',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      DataColumn2(
                        label: Expanded(
                          child: Text(
                            'Sales Source',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        size: ColumnSize.S,
                      ),
                      DataColumn2(
                        label: Expanded(
                          child: Text(
                            'Commission Paid',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        size: ColumnSize.S,
                      ),
                      DataColumn2(
                        label: Expanded(
                          child: Text(
                            'Entered to Odoo',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        size: ColumnSize.S,
                      ),
                      DataColumn2(
                        label: Expanded(
                          child: Center(
                            child: Text(
                              'Total',
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        size: ColumnSize.S,
                      ),
                      DataColumn2(
                        label: Expanded(
                          child: Text(
                            'Delivery Status',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      DataColumn2(
                        label: Expanded(
                          child: Text(
                            'EST Install Date',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        size: ColumnSize.S,
                      ),
                      DataColumn2(
                        label: Expanded(
                          child: Text(
                            'Final Commission',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        size: ColumnSize.S,
                      ),
                      DataColumn2(
                        label: Expanded(
                          child: Text(
                            'Confirmed by Manager',
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        size: ColumnSize.S,
                      ),
                    ],
                    // wrapInCard: true,
                    source: MyDataTableSource(
                      records,
                      context,
                      updateSelectedSaleNo,
                      selectedSalesNo,
                      cubit,
                      () {
                        setState(() {});
                      },
                      widget.userAccessLevel,
                      widget.currentUserId,
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
                //           return MemberDetailRecordCard(
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

class MemberDetailError extends StatelessWidget {
  const MemberDetailError({
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
            : DateFormat('MM/dd/yyyy').format(item.createDate!),
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
  //     '${DateFormat('MM-dd-yy').format(DateTime.now())}'
  //         ' Sales Commission.xlsx',
  //   )
  //   ..click();

  // // Revoke the object URL to free up resources
  // html.Url.revokeObjectUrl(url);
}

// class ItemDataSource extends AsyncDataTableSource {
//   int _totalRows = 0;

//   ItemDataSource(this.cubit);
//   final MemberDetailCubit cubit;

//   @override
//   Future<AsyncRowsResponse> getRows(int startIndex, int count) async {
//     final response =
//         await cubit.fetchSales()

//         //dio.get('https://api.example.com/items', queryParameters: {
//       'start': startIndex,
//       'count': count,
//     });

//     final data = response.data['data'] as List;
//     _totalRows = response.data['total'] as int;

//     List<DataRow> rows = data.map<DataRow>((item) {
//       return DataRow(
//         key: ValueKey(item['id']),
//         cells: [
//           DataCell(Text(item['id'].toString())),
//           DataCell(Text(item['name'].toString())),
//         ],
//       );
//     }).toList();

//     return AsyncRowsResponse(_totalRows, rows);
//   }

//   @override
//   int get rowCount => _totalRows;
// }

class MyDataTableSource extends DataTableSource {
  MyDataTableSource(
    this.data,
    this.context,
    this.updateSelectedSaleNo,
    this.selectedSalesNo,
    this.cubit,
    this.updateState,
    this.userAccessLevel,
    this.currentUserId,
  );
  final List<AwsSalesOrder> data;
  final BuildContext context;
  void Function(String salesNo, bool isSelected) updateSelectedSaleNo;
  Set<String> selectedSalesNo = {};
  final MemberDetailCubit cubit;
  void Function() updateState;
  final int userAccessLevel;
  final int currentUserId;

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
          Center(
            child: Checkbox(
              onChanged: null, //(value) {},
              value: item.xStudioCommissionPaid,
            ),
          ),
        ),
        DataCell(
          onTap: userAccessLevel < 4 ||
                  userAccessLevel != 0 //|| item.isEnteredOdoo
              ? () {}
              : () {
                  showEnteredOdooModal(
                    context,
                    item,
                    cubit,
                    currentUserId,
                    item.name!,
                    data,
                    updateState,
                  );
                },
          Center(
            child: Checkbox(
              onChanged: null,
              value: item.isEnteredOdoo,
            ),
          ),
        ),
        DataCell(
          onTap: () => onTap(item),
          Center(
            child: Text(
              formatCurrency(item.amountTotal ?? 0),
            ),
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
          Center(
            child: Text(
              item.dateDeadline == null
                  ? 'Not Set'
                  : DateFormat('MM/dd/yy').format(item.dateDeadline!),
            ),
          ),
        ),
        DataCell(
          onTap: () => onTap(item),
          Center(
            child: Text(
              r'$' +
                  calculateFinalCommission(item, item.orderLine ?? [])
                      .toStringAsFixed(2),
            ),
          ),
        ),
        DataCell(
          onTap: userAccessLevel < 3 || item.confirmedByManager
              ? () {}
              : () {
                  showConfirmByManagerModal(
                    context,
                    item,
                    cubit,
                    currentUserId,
                    item.name!,
                    data,
                    updateState,
                  );
                },
          Center(
            child: Checkbox(
              onChanged: null,
              value: item.confirmedByManager,
            ),
          ),
        ),
      ],
    );
  }

  void onTap(AwsSalesOrder item) {
    context.pushNamed(
      AwsSalesDetailsPage.name,
      pathParameters: {'id': item.id.toString()},
      extra: cubit,
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
//             : DateFormat('MM/dd/yyyy').format(item.createDate!),
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
//       '${DateFormat('MM-dd-yy').format(DateTime.now())}'
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

  final additionalCost = getAwsAdditionalCost(orderLine, landingPrices).fold(
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
          ? (order.user?.selfGen ?? 1000)
          : (order.user?.companyLead ?? 500);
  final finalCommission =
      (extraCommission + baseCommission) + (order.additionalDeduction ?? 0);

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

  final seenReferences = <String>[];

  for (final orderLine in orderLines) {
    final displayName = orderLine.product;
    final quantity = orderLine.quantity;

    if (displayName != null && quantity != null) {
      for (final landingPrice in landingPrices) {
        if (displayName
            .toLowerCase()
            .contains(landingPrice.internalReference!.toLowerCase())) {
          final isDuplicate =
              countOccurrences(seenReferences, displayName.toLowerCase()) > 0;

          matchingLandingPrices.add(
            LandingPriceWithQuantity(
              landingPrice: (isDuplicate &&
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
    if (displayName != null) {
      seenReferences.add(displayName.toLowerCase());
    }
  }

  return matchingLandingPrices.toList();
}

DateTime? findLatestAwsSalesOrder(List<AwsSalesOrder> salesOrders) {
  if (salesOrders.isEmpty) return null;

  var haha = salesOrders
      .reduce(
        (latest, current) => (latest.updatedAt ?? latest.createDate!)
                .isAfter(current.updatedAt ?? current.createDate!)
            ? latest
            : current,
      )
      .updatedAt;

  return haha;
}

Future<void> showConfirmingCommissionBreakdownModal(
  BuildContext context,
  bool confirmedByManager,
) {
  return showDialog(
    barrierColor: Colors.black.withOpacity(0.3),
    context: context,
    builder: (BuildContext dialogCon) => AlertDialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircularProgressIndicator(
            color: Color(0xff0083ff),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            '${confirmedByManager ? 'Rejecting' : 'Confirming'} '
            'Commission Breakdown...',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}

Future<void> showConfirmByManagerModal(
  BuildContext context,
  AwsSalesOrder order,
  MemberDetailCubit cubit,
  int userId,
  String name,
  List<AwsSalesOrder> data,
  void Function() updateState,
) {
  return showDialog(
    barrierColor: Colors.black.withOpacity(0.3),
    context: context,
    builder: (BuildContext dialogCon) => AlertDialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: ConfirmByManagerModal(
        order: order,
        cubit: cubit,
        context: context,
        userId: userId,
        name: name,
        data: data,
        updateState: updateState,
      ),
    ),
  );
}

class ConfirmByManagerModal extends StatefulWidget {
  const ConfirmByManagerModal({
    required this.order,
    required this.cubit,
    required this.context,
    required this.userId,
    required this.name,
    required this.data,
    required this.updateState,
    super.key,
  });
  final BuildContext context;
  final AwsSalesOrder order;
  final MemberDetailCubit cubit;
  final int userId;
  final String name;
  final List<AwsSalesOrder> data;
  final void Function() updateState;

  @override
  State<ConfirmByManagerModal> createState() => _ConfirmByManagerModalState();
}

class _ConfirmByManagerModalState extends State<ConfirmByManagerModal> {
  @override
  Widget build(BuildContext _) {
    final context = widget.context;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.order.confirmedByManager == false
              ? 'Confirm Commission Breakdown?'
              : 'Reject Commission Breakdown?',
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: context.pop,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xffB3B7C2),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () async {
                  context.pop();
                  unawaited(
                    showSavingConfirmedBy(
                      context,
                    ),
                  );
                  final isSaved = await widget.cubit.updateConfirmedBy(
                    widget.userId,
                    widget.name,
                    !widget.order.confirmedByManager,
                  );

                  if (isSaved) {
                    if (context.mounted) {
                      context.pop();
                    }

                    const snackBar = SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        'Successfully updated commission breakdown.',
                      ),
                    );

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }

                    await widget.cubit.updateSalesLocal(
                      widget.data,
                      widget.order.copyWith(
                        confirmedByManager: !widget.order.confirmedByManager,
                      ),
                    );

                    widget.updateState();
                  } else {
                    if (context.mounted) {
                      context.pop();
                    }

                    const snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Failed to update commission breakdown.',
                      ),
                    );

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xff0083ff),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Future<void> showSavingConfirmedBy(
  BuildContext context,
) {
  return showDialog(
    barrierColor: Colors.black.withOpacity(0.3),
    context: context,
    builder: (BuildContext dialogCon) => AlertDialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularProgressIndicator(
            color: Color(0xff0083ff),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            'Updating Confirmed By Manager...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}

Future<void> showEnteredOdooModal(
  BuildContext context,
  AwsSalesOrder order,
  MemberDetailCubit cubit,
  int userId,
  String name,
  List<AwsSalesOrder> data,
  void Function() updateState,
) {
  return showDialog(
    barrierColor: Colors.black.withOpacity(0.3),
    context: context,
    builder: (BuildContext dialogCon) => AlertDialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: EnteredOdooByModal(
        order: order,
        cubit: cubit,
        context: context,
        userId: userId,
        name: name,
        data: data,
        updateState: updateState,
      ),
    ),
  );
}

class EnteredOdooByModal extends StatefulWidget {
  const EnteredOdooByModal({
    required this.order,
    required this.cubit,
    required this.context,
    required this.userId,
    required this.name,
    required this.data,
    required this.updateState,
    super.key,
  });
  final BuildContext context;
  final AwsSalesOrder order;
  final MemberDetailCubit cubit;
  final int userId;
  final String name;
  final List<AwsSalesOrder> data;
  final void Function() updateState;

  @override
  State<EnteredOdooByModal> createState() => _EnteredOdooByModalState();
}

class _EnteredOdooByModalState extends State<EnteredOdooByModal> {
  @override
  Widget build(BuildContext _) {
    final context = widget.context;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.order.isEnteredOdoo) ...[
          const Text('Reject Entered to Odoo?'),
        ] else ...[
          const Text('Confirm Entered to Odoo?'),
        ],
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: context.pop,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xffB3B7C2),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () async {
                  context.pop();
                  unawaited(
                    showSavingEnteredOdooBy(
                      context,
                    ),
                  );
                  final isSaved = await widget.cubit.updateEnteredOdooBy(
                    widget.userId,
                    widget.name,
                    !widget.order.isEnteredOdoo,
                  );

                  if (isSaved) {
                    if (context.mounted) {
                      context.pop();
                    }

                    const snackBar = SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        'Successfully updated Entered to Odoo.',
                      ),
                    );

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }

                    await widget.cubit.updateSalesLocal(
                      widget.data,
                      widget.order.copyWith(
                        isEnteredOdoo: !widget.order.isEnteredOdoo,
                      ),
                    );

                    widget.updateState();
                  } else {
                    if (context.mounted) {
                      context.pop();
                    }

                    const snackBar = SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Failed to update Entered to Odoo.',
                      ),
                    );

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xff0083ff),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Future<void> showSavingEnteredOdooBy(
  BuildContext context,
) {
  return showDialog(
    barrierColor: Colors.black.withOpacity(0.3),
    context: context,
    builder: (BuildContext dialogCon) => AlertDialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularProgressIndicator(
            color: Color(0xff0083ff),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            'Updating Entered to Odoo...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}

List<AwsSalesOrder> filterRecords(
  List<AwsSalesOrder> records, {
  required Set<String> commissionStatus,
  required Set<String> invoicePaymentStatus,
  required Set<String> deliverStatus,
}) {
  return records.where((record) {
    // Check for commission status (any match)
    final commissionStatusMatch = commissionStatus.isEmpty ||
        commissionStatus
            .any((status) => status == record.xStudioCommissionPaid.toString());

    // Check for invoice payment status (any match from desired values)
    final invoicePaymentStatusMatch = invoicePaymentStatus.isEmpty ||
        invoicePaymentStatus.any(
          (status) => status == record.xStudioInvoicePaymentStatus.toString(),
        );

    // Check for delivery status (any match)
    final deliverStatusMatch = deliverStatus.isEmpty ||
        deliverStatus
            .any((status) => status == record.deliveryStatus.toString());

    // Minimum of one self-generated record and one company lead record
    // final hasSelfGeneratedAndCompanyLead =
    //     (record.user?.selfGen ?? 0) > 0 && (record.user?.companyLead ?? 0) > 0;

    // Filter based on all conditions (all checks must be true)
    return commissionStatusMatch &&
        invoicePaymentStatusMatch &&
        deliverStatusMatch;
    //&&
    //hasSelfGeneratedAndCompanyLead;
  }).toList();
}

List<AwsSalesOrder> sortRecords(
  String selectedSortValue,
  List<AwsSalesOrder> records,
) {
  if (selectedSortValue == 'Newest') {
    records.sort(
      (a, b) => b.createDate!.compareTo(a.createDate!),
    );
  }
  if (selectedSortValue == 'Oldest') {
    records.sort(
      (a, b) => a.createDate!.compareTo(b.createDate!),
    );
  }
  if (selectedSortValue == 'A-Z (Sales Rep)') {
    records.sort(
      (a, b) => (a.xStudioSalesRep1 ?? '').toLowerCase().compareTo(
            (b.xStudioSalesRep1 ?? '').toLowerCase(),
          ),
    );
  }
  if (selectedSortValue == 'Z-A (Sales Rep)') {
    records.sort(
      (a, b) => (b.xStudioSalesRep1 ?? '').toLowerCase().compareTo(
            (a.xStudioSalesRep1 ?? '').toLowerCase(),
          ),
    );
  }
  return records;
}
