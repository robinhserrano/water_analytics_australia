// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls, unused_import, inference_failure_on_function_return_type, avoid_positional_boolean_parameters

import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hive/hive.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/0_data/data/hive/user_hive_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_admin_users_detail_page/bloc/aws_admin_users_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/admin_users_detail_page/bloc/admin_users_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/widgets/pick_manager_modal.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/cubit/cloud_sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/widget/cloud_sales_record_card.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_detail_page/cubit/landing_price_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_page/cubit/landing_price_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_page/widget/landing_price_card.dart';
import 'package:water_analytics_australia/2_application/pages/login/view/login_page.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';
import 'package:water_analytics_australia/core/widgets/custom_text_field.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class AwsAdminUsersDetailPageWrapperProvider extends StatelessWidget {
  const AwsAdminUsersDetailPageWrapperProvider({required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AwsAdminUsersDetailCubit>(),
      child: AwsAdminUsersDetailPage(
        id: id,
      ),
    );
  }
}

class AwsAdminUsersDetailPage extends StatefulWidget {
  const AwsAdminUsersDetailPage({required this.id, super.key});

  static const name = 'awsAdminUsersDetail';
  static const path = '/awsAdminUsersDetail/:id';

  final String id;

  @override
  State<AwsAdminUsersDetailPage> createState() =>
      _AwsAdminUsersDetailPageState();
}

class _AwsAdminUsersDetailPageState extends State<AwsAdminUsersDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ctrlSearch = TextEditingController();
  bool isValidating = false;

  @override
  void initState() {
    super.initState();
    context.read<AwsAdminUsersDetailCubit>().fetchUserById(widget.id);
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
        onRefresh: () => context.read<AwsAdminUsersDetailCubit>().fetchUserById(
              widget.id,
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: BlocBuilder<AwsAdminUsersDetailCubit,
              AwsAdminUsersDetailCubitState>(
            builder: (context, state) {
              if (state is AwsAdminUsersDetailStateLoading) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: ShimmerBox(
                      height: 110,
                    ),
                  ),
                );
              } else if (state is AwsAdminUsersDetailStateLoaded) {
                return EditLandingPricePage(
                  user: state.user,
                );
              } else if (state is AwsAdminUsersDetailStateError) {
                return SalesListPageError(
                  onRefresh: () =>
                      context.read<AwsAdminUsersDetailCubit>().fetchUserById(
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

  final AwsUser user;

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
    salesManagerId = widget.user.salesManagerId;
    accessLevel = widget.user.accessLevel;
    _getUserFromHive();
    super.initState();
  }

  Future<void> _getUserFromHive() async {
    final user = await HiveHelper.getCurrentUser();
    userAccessLevel = user?.accessLevel ?? 1;

    setState(() {});
  }

  int? accessLevel;
  int? userAccessLevel;
  int? salesManagerId;

  final List<String> leadSource = [
    'Sales Person',
    'Sales Team Manager',
    'Sales Manager',
    'Admin',
    'Super Admin',
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AwsAdminUsersDetailCubit>();

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
                if ((userAccessLevel ?? 1) >= 4) ...[
                  const Text(
                    'User Role',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    isExpanded: true,
                    hint: const Text('Select Role'),
                    value: accessLevel == null
                        ? null
                        : accessLevelToString(accessLevel!),
                    items: leadSource
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        accessLevel = stringToAccessLevel(value ?? '');
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      height: 60,
                      padding: EdgeInsets.only(left: 20, right: 10),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  OutlinedButton(
                    onPressed: null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          const Text(
                            'Select Manager',
                            style: TextStyle(
                              color: Color(0xff667085),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () async {
                              final data = await showPickManager(
                                context,
                                salesManagerId != null ? [salesManagerId!] : [],
                                widget.user.id,
                                accessLevel ?? widget.user.accessLevel,
                              );

                              //  if (data != null) {
                              setState(() {
                                if (data == null || data.isEmpty) {
                                  salesManagerId = null;
                                } else {
                                  salesManagerId = data.first;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xff7F56D9),
                            ),
                            child: salesManagerId == null
                                ? const Text(
                                    'Select',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                : const Row(
                                    children: [
                                      HeroIcon(
                                        HeroIcons.tag,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        '1',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                AwsUser(
                  id: widget.user.id,
                  displayName: widget.user.displayName,
                  email: widget.user.email,
                  salesManagerId:
                      salesManagerId, //?? widget.user.salesManagerId,
                  accessLevel: accessLevel ?? widget.user.accessLevel,
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
            'Update',
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
