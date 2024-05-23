// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_sales_record_model.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/cubit/cloud_sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/widget/cloud_sales_record_card.dart';
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

  @override
  State<CloudSalesPage> createState() => _CloudSalesPageState();
}

class _CloudSalesPageState extends State<CloudSalesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ctrlSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const HomeEndDrawer(),
      backgroundColor: const Color(0xfff9fafb), // Colors.blueGrey.shade50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff0083ff),
        title: const Text(
          'Sales Quotation - Firebase',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
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
                return Scaffold(
                  backgroundColor: const Color(0xfff9fafb),
                  body: state.records.isEmpty
                      ? const Center(
                          child: Text('No sales yet.'),
                        )
                      : Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffeeeef0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
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
                            ),
                            // Expanded(
                            //   child: PaginatedDataTable2(
                            //     columns: const [
                            //       DataColumn(label: Text('Number')),
                            //       DataColumn(label: Text('Customer')),
                            //       DataColumn(label: Text('Sales Source')),
                            //     ],
                            //     source: MyDataTableSource(state.records),
                            //   ),
                            // ),
                            Expanded(
                              child: Scrollbar(
                                child: ListView.builder(
                                  itemCount: state.records.length,
                                  itemBuilder: (context, index) {
                                    final record = state.records[index];
                                    if ((record.name?.toLowerCase() ?? '')
                                            .contains(
                                          ctrlSearch.text.toLowerCase(),
                                        ) ||
                                        (record.partnerIdDisplayName ?? '')
                                            .toLowerCase()
                                            .contains(
                                              ctrlSearch.text.toLowerCase(),
                                            )) {
                                      return CloudSalesRecordCard(
                                        record: record,
                                      );
                                    }

                                    return const SizedBox();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                );
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
  MyDataTableSource(this.data);
  final List<CloudSalesOrder> data;
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
        DataCell(Text(item.name ?? '')),
        DataCell(Text(item.partnerIdDisplayName ?? '')),
        DataCell(Text(item.xStudioSalesSource ?? '')),
      ],
    );
  }

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => selectedRows.length;
}
