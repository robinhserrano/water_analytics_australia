// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls, unused_import, inference_failure_on_function_return_type, avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:hive/hive.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:water_analytics_australia/0_data/data/hive/user_hive_model.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/2_application/landing_price_detail_page/cubit/landing_price_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/landing_price_page/cubit/landing_price_cubit.dart';
import 'package:water_analytics_australia/2_application/landing_price_page/widget/landing_price_card.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/cubit/cloud_sales_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/widget/cloud_sales_record_card.dart';
import 'package:water_analytics_australia/2_application/pages/login/view/login_page.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/widgets/custom_text_field.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class LandingPriceDetailPageWrapperProvider extends StatelessWidget {
  const LandingPriceDetailPageWrapperProvider({required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LandingPriceDetailCubit>(),
      child: LandingPriceDetailPage(
        id: id,
      ),
    );
  }
}

class LandingPriceDetailPage extends StatefulWidget {
  const LandingPriceDetailPage({required this.id, super.key});

  static const name = 'landingPriceDetail';
  static const path = '/landingPriceDetail/:id';

  final String id;

  @override
  State<LandingPriceDetailPage> createState() => _LandingPriceDetailPageState();
}

class _LandingPriceDetailPageState extends State<LandingPriceDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ctrlSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<LandingPriceDetailCubit>().fetchLandingPriceDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xfff9fafb),
      appBar: AppBar(
        backgroundColor: const Color(0xff0083ff),
        title: const Text(
          'Edit Landing Price',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () =>
            context.read<LandingPriceDetailCubit>().fetchLandingPriceDetails(
                  widget.id,
                ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: BlocBuilder<LandingPriceDetailCubit,
              LandingPriceDetailCubitState>(
            builder: (context, state) {
              if (state is LandingPriceDetailStateLoading) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: ShimmerBox(
                      height: 110,
                    ),
                  ),
                );
              } else if (state is LandingPriceDetailStateLoaded) {
                return EditLandingPricePage(
                  landingPrice: state.records,
                );
              } else if (state is LandingPriceDetailStateError) {
                return SalesListPageError(
                  onRefresh: () => context
                      .read<LandingPriceDetailCubit>()
                      .fetchLandingPriceDetails(
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
  const EditLandingPricePage({required this.landingPrice, super.key});

  final CloudLandingPrice landingPrice;

  @override
  State<EditLandingPricePage> createState() => _EditLandingPricePageState();
}

class _EditLandingPricePageState extends State<EditLandingPricePage> {
  TextEditingController ctrlProductName = TextEditingController();
  TextEditingController ctrlInstallationService = TextEditingController();
  TextEditingController ctrlSupplyOnly = TextEditingController();
  bool isValidating = false;

  @override
  void initState() {
    ctrlProductName.text = widget.landingPrice.name;
    ctrlInstallationService.text =
        widget.landingPrice.installationService.toString();
    ctrlSupplyOnly.text = widget.landingPrice.supplyOnly.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LandingPriceDetailCubit>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.landingPrice.internalReference,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              ctrl: ctrlProductName,
              onChanged: (value) {
                setState(() {});
              },
              title: 'Product Name',
              isValidating: isValidating,
              //inputType: const TextInputType.numberWithOptions(decimal: true),
            ),
            CustomTextField(
              ctrl: ctrlInstallationService,
              onChanged: (value) {
                setState(() {});
              },
              title: 'Installation Service',
              isValidating: isValidating,
              inputType: const TextInputType.numberWithOptions(decimal: true),
            ),
            CustomTextField(
              ctrl: ctrlSupplyOnly,
              onChanged: (value) {
                setState(() {});
              },
              title: 'Supply Only',
              isValidating: isValidating,
              inputType: const TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: ElevatedButton(
          onPressed: () {
            cubit.saveLandingPriceDetails(
              LandingPrice(
                name: ctrlProductName.text,
                internalReference: widget.landingPrice.internalReference,
                productCategory: widget.landingPrice.productCategory,
                installationService:
                    double.tryParse(ctrlInstallationService.text) ?? 0,
                supplyOnly: double.tryParse(ctrlSupplyOnly.text) ?? 0,
              ),
            );
          },
          child: const Text('Save'),
        ),
      ),
    );
  }
}
