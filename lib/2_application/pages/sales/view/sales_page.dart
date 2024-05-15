// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hive/hive.dart';
import 'package:water_analytics_australia/0_data/data/hive/sort_filter_hive_model.dart';
import 'package:water_analytics_australia/0_data/data/hive/user_hive_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
import 'package:water_analytics_australia/2_application/pages/login/view/login_page.dart';
import 'package:water_analytics_australia/2_application/pages/sales/bloc/cubit/sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/sales/widgets/sales_record_card.dart';
import 'package:water_analytics_australia/2_application/pages/sales/widgets/sort_filter_modal.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class SalesPageWrapperProvider extends StatelessWidget {
  const SalesPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SalesCubit>(),
      child: const SalesPage(),
    );
  }
}

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  static const name = 'sales';
  static const path = '/sales';

  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  static void closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  static void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SalesCubit>();

    return Scaffold(
      key: SalesPage._scaffoldKey,
      endDrawer: const EndDrawer(),
      drawer: SortFilterModal(
        onChanged: () => setState(() {}),
      ),
      backgroundColor: const Color(0xfff9fafb),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'Sales Quotation - Odoo',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          BlocBuilder<SalesCubit, SalesCubitState>(
            builder: (context, state) {
              if (state is SalesStateLoaded) {
                return IconButton(
                  onPressed: () {
                    showSaveAllSalesModal(context, state.records, cubit);
                  },
                  icon: const HeroIcon(
                    HeroIcons.arrowUpOnSquareStack,
                    color: Colors.white,
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          IconButton(
            onPressed: () =>
                SalesPage._scaffoldKey.currentState!.openEndDrawer(),
            icon: const HeroIcon(
              HeroIcons.bars3,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () => context.read<SalesCubit>().fetchSales(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: BlocBuilder<SalesCubit, SalesCubitState>(
            builder: (context, state) {
              if (state is SalesStateLoading) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: ShimmerBox(
                      height: 110,
                    ),
                  ),
                );
              } else if (state is SalesStateLoaded) {
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

                      // final one = state.records.where(
                      //   (e) {
                      //     if (commissionStatus.isNotEmpty) {
                      //       return commissionStatus.contains(
                      //         e.xStudioCommissionPaid.toString(),
                      //       );
                      //     } else {
                      //       return true;
                      //     }
                      //   },
                      // ).toList();

                      // final two = one.where(
                      //   (e) {
                      //     if (invoicePaymentStatus.isNotEmpty) {
                      //       return invoicePaymentStatus.contains(
                      //         e.xStudioInvoicePaymentStatus.toString(),
                      //       );
                      //     } else {
                      //       return true;
                      //     }
                      //   },
                      // ).toList();

                      // final three = two.where(
                      //   (e) {
                      //     if (deliverStatus.isNotEmpty) {
                      //       return deliverStatus.contains(
                      //         e.deliveryStatus.toString(),
                      //       );
                      //     } else {
                      //       return true;
                      //     }
                      //   },
                      // ).toList();   

                      return SalesListPageLoaded(
                        records: filteredRecords,
                      );
                    }
                    return SalesListPageLoaded(
                      records: state.records,
                    );
                  },
                );
              } else if (state is SalesStateError) {
                return SalesListPageError(
                  onRefresh: () => context.read<SalesCubit>().fetchSales(),
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

  final List<SalesOrder> records;

  @override
  State<SalesListPageLoaded> createState() => _SalesListPageLoadedState();
}

class _SalesListPageLoadedState extends State<SalesListPageLoaded> {
  final ctrlSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9fafb),
      body: widget.records.isEmpty
          ? const Center(
              child: Text('No sales yet.'),
            )
          : Column(
              children: [
                Text(widget.records.length.toString()),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffeeeef0),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        margin: const EdgeInsets.only(
                          left: 16,
                          top: 8,
                          bottom: 8,
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
                            // if (ctrlSearch.text.trim().length > 3) {
                            //   cubit.fetch(
                            //     searchQuery: ctrlSearch.text,
                            //   );
                            // } else {
                            //   cubit.updateIsSearching(value: true);
                            // }
                            setState(() {}); //FIX THISSSSSSSSSSSSSSSS
                          },
                          onEditingComplete: () {
                            // if (ctrlSearch.text.trim().length > 3) {
                            //   cubit.fetch(
                            //     searchQuery: ctrlSearch.text,
                            //     isSubmitted: true,
                            //   );
                            // }
                          },
                          onFieldSubmitted: (value) {
                            // if (value.trim().length > 3) {
                            //   cubit.fetch(
                            //     searchQuery: value,
                            //     isSubmitted: true,
                            //   );
                            // }
                          },
                        ),
                      ),
                    ),
                    const IconButton(
                      onPressed: SalesPage.openDrawer,
                      icon: HeroIcon(
                        HeroIcons.adjustmentsHorizontal,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Scrollbar(
                    child: ListView.builder(
                      itemCount: widget.records.length,
                      itemBuilder: (context, index) {
                        final record = widget.records[index];
                        if ((record.name?.toLowerCase() ?? '').contains(
                              ctrlSearch.text.toLowerCase(),
                            ) ||
                            (record.partnerId?.displayName ?? '')
                                .toLowerCase()
                                .contains(
                                  ctrlSearch.text.toLowerCase(),
                                )) {
                          return SalesRecordCard(
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
                          // Text(user.first.password),
                          // Text(
                          //   textAlign: TextAlign.center,
                          //   user.first.userTz,
                          //   style: const TextStyle(color: Color(0xff7a7a7a)),
                          // ),
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

Future<void> showSaveAllSalesModal(
  BuildContext context,
  List<SalesOrder> sales,
  SalesCubit cubit,
) {
  return showDialog(
    barrierColor: Colors.black.withOpacity(0.3),
    context: context,
    builder: (BuildContext dialogCon) => AlertDialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: SaveAllSalesModal(
        sales: sales,
        cubit: cubit,
      ),
    ),
  );
}

class SaveAllSalesModal extends StatefulWidget {
  const SaveAllSalesModal({
    required this.sales,
    required this.cubit,
    super.key,
  });
  final List<SalesOrder> sales;
  final SalesCubit cubit;

  @override
  State<SaveAllSalesModal> createState() => _SaveAllSalesModalState();
}

class _SaveAllSalesModalState extends State<SaveAllSalesModal> {
  bool isSaving = false;
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return isSaving
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Syncing Sales to Firebase... (${progress.toStringAsFixed(2)}%)',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              LinearProgressIndicator(
                value: progress / 100,
                backgroundColor: Colors.grey[300],
              ),
            ],
          )
        : Column(
            children: [
              const Text(
                'Sync oodo data now to Firebase?',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
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
                        setState(() {
                          isSaving = true;
                        });

                        final isSaved = await widget.cubit
                            .saveAllSales(widget.sales, (progress) {
                          setState(() {
                            this.progress = progress;
                          });
                        });

                        if (isSaved) {
                          if (context.mounted) {
                            context.pop();
                          }

                          const snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content:
                                Text('Successfully synced data to firebase.'),
                          );

                          if (context.mounted) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {
                          if (context.mounted) {
                            context.pop();
                          }

                          const snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Failed to sync data to firebase.'),
                          );

                          if (context.mounted) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
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
