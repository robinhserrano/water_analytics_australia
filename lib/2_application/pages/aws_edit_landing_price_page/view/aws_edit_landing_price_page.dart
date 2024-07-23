// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls, unused_import, inference_failure_on_function_return_type, avoid_positional_boolean_parameters, prefer_null_aware_method_calls

import 'dart:async';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hive/hive.dart';
// import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/0_data/data/hive/user_hive_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_user_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/2_application/pages/admin_users_detail_page/bloc/admin_users_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/aws_admin_users_detail_page/bloc/aws_admin_users_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/aws_edit_landing_price_page/bloc/aws_edit_landing_price_cubit.dart';
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

class EditLandingPricePageProvider extends StatelessWidget {
  const EditLandingPricePageProvider({
    required this.id,
    super.key,
    this.onLandingPriceEdited,
  });
  final void Function()? onLandingPriceEdited;
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AwsEditLandingPriceCubit>(),
      child: EditLandingPricePage(
        id: id,
        onLandingPriceEdited: onLandingPriceEdited,
      ),
    );
  }
}

class EditLandingPricePage extends StatefulWidget {
  const EditLandingPricePage({
    required this.id,
    super.key,
    this.onLandingPriceEdited,
  });

  static const name = 'awsAdminUsersDetail';
  static const path = '/awsAdminUsersDetail/:id';

  final int id;
  final void Function()? onLandingPriceEdited;

  @override
  State<EditLandingPricePage> createState() => _EditLandingPricePageState();
}

class _EditLandingPricePageState extends State<EditLandingPricePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ctrlSearch = TextEditingController();
  bool isValidating = false;

  @override
  void initState() {
    super.initState();
    context
        .read<AwsEditLandingPriceCubit>()
        .fetchLandingPriceById(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xfff9fafb),
      // appBar: AppBar(
      //   backgroundColor: Colors.black, //const Color(0xff0083ff),
      //   title: const Text(
      //     'Edit User',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   actions: [
      //     if (widget.onLandingPriceEdited != null) ...[
      //       IconButton(
      //         onPressed: () {
      //           context.pop();
      //         },
      //         icon: const HeroIcon(HeroIcons.xMark),
      //       ),
      //     ],
      //   ],
      // ),
      appBar: AppBar(
        backgroundColor: Colors.black, //const Color(0xff0083ff),
        title: const Text(
          'Edit Landing Price',
          style: TextStyle(color: Colors.white),
        ),

        actions: [
          if (widget.onLandingPriceEdited != null) ...[
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const HeroIcon(HeroIcons.xMark),
            ),
          ],
        ],
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () =>
            context.read<AwsEditLandingPriceCubit>().fetchLandingPriceById(
                  widget.id.toString(),
                ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: BlocBuilder<AwsEditLandingPriceCubit,
              AwsEditLandingPriceCubitState>(
            builder: (context, state) {
              if (state is AwsEditLandingPriceStateLoading) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: ShimmerBox(
                      height: 110,
                    ),
                  ),
                );
              } else if (state is AwsEditLandingPriceStateLoaded) {
                return EditLandingPriceLoaded(
                  // user: state.user,
                  landingPrice: state.landingPrice,
                  onLandingPriceEdited: widget.onLandingPriceEdited,
                );
              } else if (state is AwsEditLandingPriceStateError) {
                return EditLandingPricePageError(
                  onRefresh: () => context
                      .read<AwsEditLandingPriceCubit>()
                      .fetchLandingPriceById(
                        widget.id.toString(),
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

class EditLandingPriceLoaded extends StatefulWidget {
  const EditLandingPriceLoaded({
    required this.landingPrice,
    super.key,
    this.onLandingPriceEdited,
  });

  final void Function()? onLandingPriceEdited;
  final AwsLandingPrice landingPrice;

  static const name = 'editLandingPriceLoaded';
  static const path = '/editLandingPriceLoaded';

  @override
  State<EditLandingPriceLoaded> createState() => _EditLandingPriceLoadedState();
}

class _EditLandingPriceLoadedState extends State<EditLandingPriceLoaded> {
  TextEditingController ctrlInternalReference = TextEditingController();
  TextEditingController ctrlProductName = TextEditingController();
  TextEditingController ctrlInstallationService = TextEditingController();
  TextEditingController ctrlSupplyOnly = TextEditingController();
  bool isValidating = false;

  @override
  void initState() {
    final landingPrice = widget.landingPrice;

    final history = landingPrice.history!.toList()
      ..sort(
        (a, b) => b.recordedAt!.compareTo(a.recordedAt!),
      );

    ctrlInternalReference.text = landingPrice.internalReference ?? '';
    ctrlProductName.text = landingPrice.name ?? '';
    ctrlInstallationService.text =
        (history.first.installationService ?? 0).toString();
    ctrlSupplyOnly.text = (history.first.supplyOnly ?? 0).toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AwsEditLandingPriceCubit>();
    // final cubit = widget.cubit;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black, //const Color(0xff0083ff),
      //   title: const Text(
      //     'Edit Landing Price',
      //     style: TextStyle(color: Colors.white),
      //   ),

      //   actions: [
      //     if (widget.onLandingPriceEdited != null) ...[
      //       IconButton(
      //         onPressed: () {
      //           context.pop();
      //         },
      //         icon: const HeroIcon(HeroIcons.xMark),
      //       ),
      //     ],
      //   ],
      // ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              //    crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    '',
                    // widget.LandingPrice
                    //     .displayName, //widget.landingPrice.internalReference,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  ctrl: ctrlInternalReference,
                  onChanged: (value) {
                    setState(() {});
                  },
                  title: 'Internal Reference',
                  isValidating: isValidating,
                ),
                CustomTextField(
                  ctrl: ctrlProductName,
                  onChanged: (value) {
                    setState(() {});
                  },
                  title: 'Product Name',
                  isValidating: isValidating,
                ),
                // CustomTextField(
                //   ctrl: ctrlProductName,
                //   onChanged: (value) {
                //     setState(() {});
                //   },
                //   title: 'Category',
                //   isValidating: isValidating,
                // ),
                CustomTextField(
                  ctrl: ctrlInstallationService,
                  onChanged: (value) {
                    setState(() {});
                  },
                  title: 'Installation Service',
                  isValidating: isValidating,
                  inputType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                CustomTextField(
                  ctrl: ctrlSupplyOnly,
                  onChanged: (value) {
                    setState(() {});
                  },
                  title: 'Supply Only',
                  isValidating: isValidating,
                  inputType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                // CustomTextField(
                //   ctrl: ctrlInstallationService,
                //   onChanged: (value) {
                //     setState(() {});
                //   },
                //   title: 'Commission Split (%)',
                //   isValidating: isValidating,
                //   inputType:
                //       const TextInputType.numberWithOptions(decimal: true),
                // ),
                const SizedBox(
                  height: 80,
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
            if (ctrlInstallationService.text.isEmpty) {
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
              final success = await cubit.updateLandingPrice(
                ctrlInternalReference.text,
                ctrlProductName.text,
                '',
                double.tryParse(ctrlInstallationService.text) ?? 0,
                double.tryParse(ctrlSupplyOnly.text) ?? 0,
              );

              if (success) {
                if (context.mounted) {
                  context.pop();
                }

                const snackBar = SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Successfully updated Landing Price.'),
                );

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                if (widget.onLandingPriceEdited != null) {
                  widget.onLandingPriceEdited!();
                }
              } else {
                if (context.mounted) {
                  context.pop();
                }

                const snackBar = SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Failed to update Landing Price.'),
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
            'Creating Landing Price...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}

class EditLandingPricePageError extends StatelessWidget {
  const EditLandingPricePageError({
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
