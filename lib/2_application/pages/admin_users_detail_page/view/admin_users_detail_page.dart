// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls, unused_import, inference_failure_on_function_return_type, avoid_positional_boolean_parameters

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hive/hive.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/0_data/data/hive/user_hive_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/2_application/pages/admin_users_detail_page/bloc/admin_users_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/cubit/cloud_sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/widget/cloud_sales_record_card.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_detail_page/cubit/landing_price_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_page/cubit/landing_price_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_page/widget/landing_price_card.dart';
import 'package:water_analytics_australia/2_application/pages/login/view/login_page.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/widgets/custom_text_field.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class AdminUsersDetailPageWrapperProvider extends StatelessWidget {
  const AdminUsersDetailPageWrapperProvider({required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdminUsersDetailCubit>(),
      child: AdminUsersDetailPage(
        id: id,
      ),
    );
  }
}

class AdminUsersDetailPage extends StatefulWidget {
  const AdminUsersDetailPage({required this.id, super.key});

  static const name = 'adminUsersDetail';
  static const path = '/adminUsersDetail/:id';

  final String id;

  @override
  State<AdminUsersDetailPage> createState() => _AdminUsersDetailPageState();
}

class _AdminUsersDetailPageState extends State<AdminUsersDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ctrlSearch = TextEditingController();
  bool isValidating = false;

  @override
  void initState() {
    super.initState();
    context.read<AdminUsersDetailCubit>().fetchUserById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xfff9fafb),
      appBar: AppBar(
        backgroundColor: Colors.black, //const Color(0xff0083ff),
        title: const Text(
          'Edit User',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () => context.read<AdminUsersDetailCubit>().fetchUserById(
              widget.id,
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: BlocBuilder<AdminUsersDetailCubit, AdminUsersDetailCubitState>(
            builder: (context, state) {
              if (state is AdminUsersDetailStateLoading) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: ShimmerBox(
                      height: 110,
                    ),
                  ),
                );
              } else if (state is AdminUsersDetailStateLoaded) {
                return EditLandingPricePage(
                  user: state.user,
                );
              } else if (state is AdminUsersDetailStateError) {
                return SalesListPageError(
                  onRefresh: () =>
                      context.read<AdminUsersDetailCubit>().fetchUserById(
                            widget.id,
                          ),
                );
              }
              return const SizedBox(
                child: Text('unknown'),
              );
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

class EditLandingPricePage extends StatefulWidget {
  const EditLandingPricePage({required this.user, super.key});

  final CloudUser user;

  @override
  State<EditLandingPricePage> createState() => _EditLandingPricePageState();
}

class _EditLandingPricePageState extends State<EditLandingPricePage> {
  TextEditingController ctrlCommissionSplit = TextEditingController();
  // TextEditingController ctrlInstallationService = TextEditingController();
  // TextEditingController ctrlSupplyOnly = TextEditingController();
  bool isValidating = false;

  @override
  void initState() {
    ctrlCommissionSplit.text = widget.user.commissionSplit.toString();
    // ctrlInstallationService.text =
    //     widget.landingPrice.installationService.toString();
    // ctrlSupplyOnly.text = widget.landingPrice.supplyOnly.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AdminUsersDetailCubit>();

    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.user
                        .displayName, //widget.landingPrice.internalReference,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  ctrl: ctrlCommissionSplit,
                  onChanged: (value) {
                    setState(() {});
                  },
                  title: 'Commission Split (%)',
                  isValidating: isValidating,
                  inputType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xff475467),
          ),
          onPressed: () async {
            if (ctrlCommissionSplit.text.isEmpty) {
              setState(() {
                isValidating = true;
              });
            } else {
              setState(() {
                isValidating = false;
              });
            }

            if (isValidating == false) {
              unawaited(showSavingModal(context));
              final success = await cubit.updateUser(
                CloudUser(
                  displayName: widget.user.displayName,
                  email: widget.user.email,
                  photoUrl: widget.user.photoUrl,
                  accessLevel: widget.user.accessLevel,
                  commissionSplit:
                      double.tryParse(ctrlCommissionSplit.text) ?? 0,
                ),
              );

              if (success) {
                if (context.mounted) {
                  context.pop();
                }

                const snackBar = SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Successfully updated user details.'),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              } else {
                if (context.mounted) {
                  context.pop();
                }

                const snackBar = SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Failed to update user details.'),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              }
            }
          },
          child: const Text(
            'Save',
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> showSavingModal(
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
            'Updating User Details...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
