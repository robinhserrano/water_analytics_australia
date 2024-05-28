// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls, prefer_int_literals

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
import 'package:water_analytics_australia/2_application/pages/admin_users/cloud_sales_details/bloc/admin_users_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/admin_users_detail_page/view/admin_users_detail_page.dart';
import 'package:water_analytics_australia/2_application/pages/sales/widgets/sort_filter_modal.dart';
import 'package:water_analytics_australia/core/widgets/home_end_drawer.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class AdminUsersPageWrapperProvider extends StatelessWidget {
  const AdminUsersPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdminUsersCubit>(),
      child: AdminUsersPage(
        client: sl<OdooClient>(),
      ),
    );
  }
}

class AdminUsersPage extends StatefulWidget {
  const AdminUsersPage({required this.client, super.key});

  static const name = 'adminUsers';
  static const path = '/adminUsers';

  final OdooClient client;

  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  static void closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  static void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  State<AdminUsersPage> createState() => _AdminUsersPageState();
}

class _AdminUsersPageState extends State<AdminUsersPage> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//  final ctrlSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AdminUsersPage._scaffoldKey,
      drawer: SortFilterModal(
        onChanged: () => setState(() {}),
      ),
      endDrawer: const HomeEndDrawer(),
      backgroundColor: const Color(0xfff9fafb), // Colors.blueGrey.shade50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black, //(0xff0083ff),
        title: const Text(
          'Users',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                AdminUsersPage._scaffoldKey.currentState!.openEndDrawer(),
            icon: const HeroIcon(
              HeroIcons.bars3,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () => context.read<AdminUsersCubit>().fetchUsers(),
        child: BlocBuilder<AdminUsersCubit, AdminUsersCubitState>(
          builder: (context, state) {
            if (state is AdminUsersStateLoading) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: ShimmerBox(
                    height: 110,
                  ),
                ),
              );
            } else if (state is AdminUsersStateLoaded) {
              return AdminUsersPageLoaded(
                users: state.users,
              );
              // return FutureBuilder<Box<SortFilterHive>>(
              //   future: Hive.openBox<SortFilterHive>('sortFilter'),
              //   builder: (context, snapshot) {
              //     SortFilterHive? sortFilterData;

              //     try {
              //       sortFilterData = snapshot.data?.values.first;
              //     } catch (e) {
              //       sortFilterData = null;
              //     }

              //     if (sortFilterData != null) {
              //       final commissionStatus =
              //           sortFilterData.selectedCommissionStatus;
              //       final invoicePaymentStatus =
              //           sortFilterData.selectedInvoicePaymentStatus;
              //       final deliverStatus = sortFilterData.selectedDeliverStatus;

              //       final filteredRecords = state.users;
              //       //     .where(
              //       //       (record) =>
              //       //           (!commissionStatus.any(
              //       //             (status) =>
              //       //                 status !=
              //       //                 record.xStudioCommissionPaid.toString(),
              //       //           )) &&
              //       //           (!invoicePaymentStatus.any(
              //       //             (status) =>
              //       //                 status !=
              //       //                 record.xStudioInvoicePaymentStatus
              //       //                     .toString(),
              //       //           )) &&
              //       //           (!deliverStatus.any(
              //       //             (status) =>
              //       //                 status != record.deliveryStatus.toString(),
              //       //           )),
              //       //     )
              //       //     .toList();

              //       // final selectedSortValue = sortFilterData.selectedSortValue;
              //       // if (selectedSortValue == 'Newest') {
              //       //   filteredRecords.sort(
              //       //     (a, b) => b.createDate!.compareTo(a.createDate!),
              //       //   );
              //       // }
              //       // if (selectedSortValue == 'Oldest') {
              //       //   filteredRecords.sort(
              //       //     (a, b) => a.createDate!.compareTo(b.createDate!),
              //       //   );
              //       // }
              //       // if (selectedSortValue == 'A-Z') {
              //       //   filteredRecords.sort(
              //       //     (a, b) => (a.partnerIdDisplayName ?? '')
              //       //         .toLowerCase()
              //       //         .compareTo(
              //       //           (b.partnerIdDisplayName ?? '').toLowerCase(),
              //       //         ),
              //       //   );
              //       // }
              //       // if (selectedSortValue == 'Z-A') {
              //       //   filteredRecords.sort(
              //       //     (a, b) => (b.partnerIdDisplayName ?? '')
              //       //         .toLowerCase()
              //       //         .compareTo(
              //       //           (a.partnerIdDisplayName ?? '').toLowerCase(),
              //       //         ),
              //       //   );
              //       // }
              //       return AdminUsersPageLoaded(
              //         users: filteredRecords,
              //       );
              //     }
              //     return AdminUsersPageLoaded(
              //       users: state.users,
              //     );
              //   },
              // );
              //return AdminUsersPageLoaded(records: state.records);
            } else if (state is AdminUsersStateError) {
              return AdminUsersPageError(
                onRefresh: () => context.read<AdminUsersCubit>().fetchUsers(),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class AdminUsersPageLoaded extends StatefulWidget {
  const AdminUsersPageLoaded({required this.users, super.key});

  final List<CloudUser> users;

  @override
  State<AdminUsersPageLoaded> createState() => _AdminUsersPageLoadedState();
}

class _AdminUsersPageLoadedState extends State<AdminUsersPageLoaded> {
  final ctrlSearch = TextEditingController();
  int _rowsPerPage = 10;

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.users.isEmpty
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    searchBox(),
                    // const IconButton(
                    //   onPressed: AdminUsersPage.openDrawer,
                    //   icon: HeroIcon(
                    //     HeroIcons.adjustmentsHorizontal,
                    //   ),
                    // ),
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
                    // const IconButton(
                    //   onPressed: AdminUsersPage.openDrawer,
                    //   icon: HeroIcon(
                    //     HeroIcons.adjustmentsHorizontal,
                    //   ),
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
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Role')),
                      DataColumn(label: Text('Commission %')),
                      DataColumn(label: Text('Actions')),
                    ],
                    source: MyDataTableSource(widget.users, context),
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
                //           return AdminUsersRecordCard(
                //             record: record,
                //           );
                //         }

                //         return const SizedBox();
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
    );
  }
}

class AdminUsersPageError extends StatelessWidget {
  const AdminUsersPageError({
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
  MyDataTableSource(this.data, this.context);
  final List<CloudUser> data;
  final BuildContext context;
  Set<int> selectedRows = {};

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
      index: index,
      cells: [
        // DataCell(
        //   onTap: () => onTap(item),
        //   Text(
        //     item.name ?? '',
        //     style: const TextStyle(
        //       fontWeight: FontWeight.w600,
        //       color: Color(0xff374151),
        //     ),
        //   ),
        // ),
        // DataCell(
        //   onTap: () => onTap(item),
        //   Text(
        //     item.createDate == null
        //         ? ''
        //         : DateFormat('MM/dd/yyyy hh:mm a').format(item.createDate!),
        //   ),
        // ),
        DataCell(
          onTap: () {},
          Text(item.displayName),
        ),
        DataCell(onTap: () {}, Text(item.email)),
        DataCell(
          onTap: () {},
          Card(
            elevation: 0,
            color: accessLevelToColor(item.accessLevel.toInt()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                accessLevelToString(item.accessLevel.toInt()),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        DataCell(onTap: () {}, Text(item.commissionSplit.toString())),
        DataCell(
          onTap: () {
            context.pushNamed(
              AdminUsersDetailPage.name,
              pathParameters: {'id': item.email},
            );
          },
          const HeroIcon(
            HeroIcons.pencilSquare,
          ),
        ),
        // DataCell(
        //   onTap: () => onTap(item),
        //   Checkbox(
        //     onChanged: null, //(value) {},
        //     value: item.xStudioCommissionPaid,
        //   ),
        // ),
        // DataCell(
        //   onTap: () => onTap(item),
        //   Text(
        //     formatCurrency(item.amountTotal ?? 0),
        //   ),
        // ),
        // DataCell(
        //   onTap: () => onTap(item),
        //   Text(
        //     (item.deliveryStatus ?? '').toString() == 'full'
        //         ? 'Fully Delivered'
        //         : (item.deliveryStatus ?? '').toString() == 'partial'
        //             ? 'Partially Delivered'
        //             : '',
        //   ),
        // ),
      ],
    );
  }

  // void onTap(AdminUsersOrder item) {
  //   context.pushNamed(
  //     AdminUsersDetailsPage.name,
  //     pathParameters: {'id': item.id.toString()},
  //   );
  // }

  @override
  int get selectedRowCount => selectedRows.length;
}

String accessLevelToString(int accessLevel) {
  switch (accessLevel) {
    case 1:
      return 'Sales Person';
    case 2:
      return 'Sales Team Manager';
    case 3:
      return 'Sales Manager';
    case 4:
      return 'Admin';
    case 5:
      return 'Super Admin';
    default:
      return '';
  }
}

MaterialColor accessLevelToColor(int accessLevel) {
  switch (accessLevel) {
    case 1:
      return Colors.lightGreen;
    case 2:
      return Colors.teal;
    case 3:
      return Colors.orange;
    case 4:
      return Colors.lightBlue;
    case 5:
      return Colors.blue;
    default:
      return Colors.lightGreen;
  }
}
