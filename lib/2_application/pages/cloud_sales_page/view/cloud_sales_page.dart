// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hive/hive.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/0_data/data/hive/user_hive_model.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/cubit/cloud_sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/widget/cloud_sales_record_card.dart';
import 'package:water_analytics_australia/2_application/pages/login/view/login_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const EndDrawer(),
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
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<CloudSalesCubit, CloudSalesCubitState>(
                  builder: (context, state) {
                    if (state is CloudSalesStateLoading) {
                      return ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                            : ListView.builder(
                                itemCount: state.records.length,
                                itemBuilder: (context, index) {
                                  final record = state.records[index];
                                  return CloudSalesRecordCard(
                                    record: record,
                                  );
                                },
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
            ],
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

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<Box<UserHive>>(
                  future: Hive.openBox<UserHive>('user'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final userBox = snapshot.data!;
                      final user = userBox.values.toList();
                      return Column(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            child: HeroIcon(
                              HeroIcons.userCircle,
                              size: 60,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            user.first.userName,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            user.first.userLogin,
                            style: const TextStyle(color: Color(0xff7a7a7a)),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  final box = await Hive.openBox<UserHive>('user');
                  await box.clear();
                  if (context.mounted) {
                    context.pushReplacementNamed(LoginPage.name);
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: Text(
                          'Sign Out',
                          style:
                              TextStyle(color: Color(0xffda5450), fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
