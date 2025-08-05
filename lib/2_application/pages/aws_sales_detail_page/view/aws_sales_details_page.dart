// ignore_for_file: prefer_int_literals, inference_failure_on_function_return_type, avoid_positional_boolean_parameters

import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_detail_page/bloc/aws_sales_details_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/bloc/aws_sales_cubit.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';
import 'package:water_analytics_australia/core/temp.dart';
import 'package:water_analytics_australia/core/widgets/aws_custom_data_table.dart';
import 'package:water_analytics_australia/core/widgets/custom_text_field.dart';
import 'package:water_analytics_australia/injection.dart';

class AwsSalesDetailsPageWrapperProvider extends StatelessWidget {
  const AwsSalesDetailsPageWrapperProvider({
    required this.id,
    //required this.salesCubit,
    super.key,
  });
  final String id;
  //final AwsSalesCubit? salesCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AwsSalesDetailsCubit>(),
      child: AwsSalesDetailsPage(
        id: id,
        // salesCubit: salesCubit,
      ),
    );
  }
}

class AwsSalesDetailsPage extends StatefulWidget {
  const AwsSalesDetailsPage({
    required this.id,
    super.key, //this.salesCubit
  });

  static const name = 'AwsSalesDetail';
  static const path = '/AwsSalesDetail/:id';

  final String id;
  //final AwsSalesCubit? salesCubit;

  @override
  State<AwsSalesDetailsPage> createState() => _AwsSalesDetailsPageState();
}

class _AwsSalesDetailsPageState extends State<AwsSalesDetailsPage> {
  int accessLevel = 0;
  int currentUserId = 0;
  String currentUserName = '';
  AwsSalesCubit? salesCubit;

  @override
  void initState() {
    try {
      salesCubit = context.read<AwsSalesCubit>();
    } catch (e) {
      salesCubit = null;
    }

    super.initState();
    _getUserFromHive();
    context.read<AwsSalesDetailsCubit>().fetchAwsSalesDetails(widget.id);
  }

  Future<void> _getUserFromHive() async {
    final user = await HiveHelper.getCurrentUser();
    accessLevel = user?.accessLevel ?? 1;
    currentUserId = user?.userId ?? 0;
    currentUserName = user?.displayName ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Detail',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<AwsSalesDetailsCubit, AwsSalesDetailsCubitState>(
        builder: (context, state) {
          if (state is AwsSalesDetailsStateLoading) {
            return const Column(
              children: [
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff0083ff),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is AwsSalesDetailsStateLoaded) {
            return SingleChildScrollView(
              child: AwsSalesDetailsPageLoaded(
                order: state.order,
                accessLevel: accessLevel,
                currentUserId: currentUserId,
                salesCubit: salesCubit,
                currentUserName: currentUserName,
              ),
            );
          } else if (state is AwsSalesDetailsStateError) {
            return Column(
              children: [
                Expanded(
                  child: DetailPageError(
                    onRefresh: () {
                      context
                          .read<AwsSalesDetailsCubit>()
                          .fetchAwsSalesDetails(widget.id);
                    },
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class AwsSalesDetailsPageLoaded extends HookWidget {
  const AwsSalesDetailsPageLoaded({
    required this.order,
    required this.accessLevel,
    required this.currentUserId,
    required this.salesCubit,
    required this.currentUserName,
    super.key,
  });

  final AwsSalesOrder order;
  final int accessLevel;
  final int currentUserId;
  final AwsSalesCubit? salesCubit;
  final String currentUserName;

  @override
  Widget build(BuildContext context) {
    final tabIndex = useState(0);
    final tabCtrl = useTabController(initialLength: 2);

    return BlocListener<AwsSalesDetailsCubit, AwsSalesDetailsCubitState>(
      listener: (context, state) {},
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#${order.name}',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: ResponsiveValue(
                    context,
                    conditionalValues: [
                      const Condition.smallerThan(name: TABLET, value: 24.0),
                      const Condition.equals(name: TABLET, value: 24.0),
                      const Condition.largerThan(name: TABLET, value: 28.0),
                    ],
                  ).value,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              ResponsiveRowColumn(
                rowCrossAxisAlignment: CrossAxisAlignment.start,
                rowMainAxisAlignment: MainAxisAlignment.center,
                layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                rowSpacing: 16,
                columnSpacing: 16,
                children: [
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: CloudOrderInfos(
                      order: order,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: CustomerInfoSection(
                      order: order,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ResponsiveRowColumn(
                rowCrossAxisAlignment: CrossAxisAlignment.start,
                rowMainAxisAlignment: MainAxisAlignment.center,
                rowSpacing: 16,
                columnSpacing: 16,
                layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                children: [
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: SalesInformationSection(
                      order: order,
                    ),
                  ),
                  ResponsiveRowColumnItem(
                    rowFlex: 1,
                    child: CommissionSection(
                      order: order,
                      orderLine: order.orderLine ?? [],
                      accessLevel: accessLevel,
                      currentUserId: currentUserId,
                      salesCubit: salesCubit,
                      currentUserName: currentUserName,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              OrderLines(
                order: order,
                orderLine: order.orderLine ?? [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailPageError extends StatelessWidget {
  const DetailPageError({
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

class CustomerInfoSection extends StatelessWidget {
  const CustomerInfoSection({required this.order, super.key});

  final AwsSalesOrder order;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Customer Info',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                const HeroIcon(
                  HeroIcons.user,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    order.partnerIdDisplayName ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeroIcon(
                  HeroIcons.mapPin,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    order.partnerIdContactAddress ?? '',
                    style: const TextStyle(
                      color: Color(0xff7a7a7a),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const HeroIcon(
                  HeroIcons.phone,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    (order.partnerIdPhone ?? '').toString(),
                    style: const TextStyle(
                      color: Color(0xff7a7a7a),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SalesInformationSection extends StatelessWidget {
  const SalesInformationSection({required this.order, super.key});
  final AwsSalesOrder order;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xfff5faff),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sales Information',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: DottedLine(
                lineThickness: 1.5,
                dashColor: Color(0xffadadad),
                dashLength: 8,
              ),
            ),
            Column(
              children: [
                CustomRowTile(
                  'Sales Rep',
                  order.xStudioSalesRep1 ?? '',
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomRowTile(
                  'Sales Source',
                  order.xStudioSalesSource ?? '',
                ),
                Row(
                  children: [
                    const Text(
                      'Commissions Paid',
                    ),
                    const Spacer(),
                    Checkbox(
                      value: order.xStudioCommissionPaid,
                      activeColor: Colors.blue,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({
    required this.controller,
    required this.onTabChanged,
  });

  final TabController controller;
  final Function(int) onTabChanged;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTabChanged,
      controller: controller,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(),
        insets: EdgeInsets.symmetric(horizontal: 15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      overlayColor: WidgetStateProperty.all<Color>(
        Colors.transparent,
      ),
      labelStyle: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      labelColor: const Color(0xFF000000),
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      unselectedLabelColor: const Color(0xFF667085),
      tabs: const [
        Tab(text: 'Order Lines'),
        Tab(text: 'Notes'),
      ],
    );
  }
}

class OrderLines extends StatelessWidget {
  const OrderLines({required this.order, required this.orderLine, super.key});

  final AwsSalesOrder order;
  final List<AwsOrderLine> orderLine;

  @override
  Widget build(BuildContext context) {
    if (orderLine.isEmpty) return const SizedBox(height: 16);

    var totalDescriptionLength = 0;
    final totalItems = orderLine.length;

    for (final line in orderLine) {
      final descriptionLength = line.description?.length ?? 0;
      totalDescriptionLength += descriptionLength;
    }

    final averageDescriptionLength = totalDescriptionLength / totalItems;
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: ((orderLine.length + 1) * 80) +
              (averageDescriptionLength < 40 ? 0 : averageDescriptionLength),
          child: AwsCustomDataTable(
            data: orderLine,
            total: orderLine.length,
            sortDescending: false,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
            top: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Untaxed Amount:',
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'GST 10%:',
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Total:',
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    r'$' + (order.amountUntaxed ?? 0.0).toStringAsFixed(2),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    r'$' +
                        ((order.amountTotal ?? 0.0) -
                                (order.amountUntaxed ?? 0.0))
                            .toStringAsFixed(2),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    r'$' + (order.amountTotal ?? 0.0).toStringAsFixed(2),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OtherInfo extends StatelessWidget {
  const OtherInfo({required this.order, super.key});

  final SalesOrder order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Sales',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: DottedLine(
                      lineThickness: 1.5,
                      dashColor: Color(0xffadadad),
                      dashLength: 8,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Salesperson',
                          ),
                          const Spacer(),
                          Text(
                            order.userId?.displayName ?? '',
                            style: const TextStyle(
                              color: Color(0xff7a7a7a),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Sales Team',
                          ),
                          const Spacer(),
                          Text(
                            order.teamId?.displayName ?? '',
                            style: const TextStyle(
                              color: Color(0xff7a7a7a),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Tags',
                          ),
                          const Spacer(),
                          Text(
                            order.tagIds?[0].displayName ?? '',
                            style: const TextStyle(
                              color: Color(0xff7a7a7a),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRowTile extends StatelessWidget {
  const CustomRowTile(this.title, this.desc, {super.key});
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
        ),
        const Spacer(),
        Text(
          desc,
          style: const TextStyle(
            color: Color(0xff7a7a7a),
          ),
        ),
      ],
    );
  }
}

class CommissionSection extends StatelessWidget {
  const CommissionSection({
    required this.order,
    required this.orderLine,
    required this.accessLevel,
    required this.currentUserId,
    required this.salesCubit,
    required this.currentUserName,
    super.key,
  });
  final AwsSalesOrder order;
  final List<AwsOrderLine> orderLine;
  final int accessLevel;
  final int currentUserId;
  final AwsSalesCubit? salesCubit;
  final String currentUserName;

  @override
  Widget build(BuildContext context) {
    final landingPrices =
        getCurrentLandingPrices(order.createDate ?? DateTime.now());

    final cubit = context.read<AwsSalesDetailsCubit>();
    final sellingPrice = calculateCashPrice(
      order.amountTotal ?? 0,
      (order.xStudioPaymentType ?? '').toLowerCase().contains('cash'),
    );

    final additionalCost =
        getCloudAdditionalCost(orderLine, landingPrices).fold(
      0.0,
      (prev, e) => prev + (e.taxExcl ?? 0) + ((e.taxExcl ?? 0) * 0.10),
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
        : temp * ((order.user?.commissionSplit?.toDouble() ?? 50) / 100);

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

    return Card(
      elevation: 0,
      color: const Color(0xfff5faff),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Commission Breakdown',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: DottedLine(
                lineThickness: 1.5,
                dashColor: Color(0xffadadad),
                dashLength: 8,
              ),
            ),
            CustomRowTile(
              'Selling Price',
              r'$' + sellingPrice.toStringAsFixed(2),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'Additional Deduction',
                ),
                const Spacer(),
                Text(
                  r'$' + additionalCost.toStringAsFixed(2),
                  style: TextStyle(
                    color: additionalCost > 0
                        ? Colors.red
                        : const Color(0xff7a7a7a),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            CustomRowTile(
              'Landing Price',
              r'$' + landingPrice.toStringAsFixed(2),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomRowTile(
              'Extra Commission',
              r'$' + extraCommission.toStringAsFixed(2),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomRowTile(
              'Base Commission',
              r'$' + baseCommission.toStringAsFixed(2),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'Manual Addition/Deduction',
                ),
                const SizedBox(
                  width: 4,
                ),
                if (order.manualNotes != null ||
                    (order.manualNotes ?? '').isNotEmpty)
                  Tooltip(
                    message: order.manualNotes ?? '',
                    child: const Icon(
                      FontAwesomeIcons.noteSticky,
                    ), //Icon(Icons.info),
                  ),
                const Spacer(),
                Text(
                  r'$' + (order.additionalDeduction ?? 0).toStringAsFixed(2),
                  style: TextStyle(
                    color: (order.additionalDeduction ?? 0) < 0
                        ? Colors.red
                        : const Color(0xff7a7a7a),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            //  if (additionalCost <= 0) ...[
            CustomRowTile(
              'Final Commission',
              r'$' + finalCommission.toStringAsFixed(2),
            ),
            //  ],
            Row(
              children: [
                const Text(
                  'Confirmed By Manager',
                ),
                const Spacer(),
                Checkbox(
                  value: order.confirmedByManager,
                  activeColor: Colors.blue,
                  onChanged: (value) {},
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Entered to Odoo',
                ),
                const Spacer(),
                Checkbox(
                  value: order.isEnteredOdoo,
                  activeColor: Colors.blue,
                  onChanged: (value) {},
                ),
              ],
            ),
            //ACCESS RESTRICTION
            if ((accessLevel >= 3 || accessLevel == 0) &&
                (order.xStudioSalesRep1 != currentUserName)) ...[
              Center(
                child: ResponsiveRowColumn(
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                      ? ResponsiveRowColumnType.COLUMN
                      : ResponsiveRowColumnType.ROW,
                  rowSpacing: 16,
                  columnSpacing: 16,
                  children: [
                    if (accessLevel >= 4 ||
                        order.xStudioCommissionPaid == false &&
                            accessLevel != 0) ...[
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: ElevatedButton(
                          onPressed: () async {
                            unawaited(
                              showModifyManualAdditionDeductionModal(
                                context,
                                order,
                                cubit,
                                currentUserId,
                                order.name ?? '',
                                salesCubit,
                              ),
                            );
                          },
                          child: const Text('Modify Manual +/-'),
                        ),
                      ),
                    ],
                    if (!order.xStudioCommissionPaid && accessLevel != 0) ...[
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: ElevatedButton(
                          onPressed: () async {
                            unawaited(
                              showConfirmByManagerModal(
                                context,
                                order,
                                cubit,
                                currentUserId,
                                order.name ?? '',
                              ),
                            );
                          },
                          child: Text(
                            textAlign: TextAlign.center,
                            order.confirmedByManager == false
                                ? 'Confirm Commission Breakdown'
                                : 'Reject Commission Breakdown',
                          ),
                        ),
                      ),
                    ],
                    if (accessLevel >= 4 || accessLevel == 0) ...[
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: ElevatedButton(
                          onPressed: () async {
                            unawaited(
                              showEnteredOdooModal(
                                context,
                                order,
                                cubit,
                                currentUserId,
                                order.name ?? '',
                                salesCubit,
                              ),
                            );
                          },
                          child: Text(
                            textAlign: TextAlign.center,
                            order.isEnteredOdoo == false
                                ? 'Confirm Entered to Odoo'
                                : 'Reject Entered to Odoo',
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

//Updated 7/25
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

          if (quantity > 0) {
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
          }

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

List<AwsOrderLine> getCloudAdditionalCost(
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
          if (quantity > 0) {
            matchingLandingPrices.add(
              LandingPriceWithQuantity(
                landingPrice: landingPrice,
                quantity: quantity.toDouble(),
                isSupplyOnly: isSupplyOnly,
              ),
            );
          }

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

class CloudOrderInfos extends StatelessWidget {
  const CloudOrderInfos({required this.order, super.key});

  final AwsSalesOrder order;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Order Date',
                ),
                const Spacer(),
                Text(
                  order.createDate == null
                      ? ''
                      : DateFormat('MM/dd/yy').format(order.createDate!),
                  style: const TextStyle(color: Color(0xff7a7a7a)),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'Payment Type',
                ),
                const Spacer(),
                Text(
                  order.xStudioPaymentType ?? '',
                  style: const TextStyle(
                    color: Color(0xff7a7a7a),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'Payment Status',
                ),
                const Spacer(),
                Text(
                  getInvoicePaymentStatusMessage(
                    order.xStudioInvoicePaymentStatus.toString(),
                  ),
                  style: const TextStyle(
                    color: Color(0xff7a7a7a),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'Delivery Status',
                ),
                const Spacer(),
                Text(
                  getDeliveryStatusMessage(
                    (order.deliveryStatus ?? '').toString(),
                  ),
                  style: const TextStyle(
                    color: Color(0xff7a7a7a),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'EST Install Date',
                ),
                const Spacer(),
                Text(
                  order.dateDeadline == null
                      ? 'Not Set'
                      : DateFormat('MM/dd/yy').format(
                          order.dateDeadline!.add(const Duration(days: 1)),
                        ),
                  style: const TextStyle(
                    color: Color(0xff7a7a7a),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'Amount Total',
                ),
                const Spacer(),
                Text(
                  r'$' + (order.amountTotal ?? 0).toStringAsFixed(2),
                  style: const TextStyle(
                    color: Color(0xff7a7a7a),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Text(
                  'Amount Invoiced',
                ),
                const Spacer(),
                Text(
                  r'$' + (order.amountToInvoice ?? 0).toStringAsFixed(2),
                  style: const TextStyle(
                    color: Color(0xff7a7a7a),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                Text(
                  'Referred By',
                ),
                Spacer(),
                Text(
                  '',
                  style: TextStyle(
                    color: Color(0xff7a7a7a),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Referrer Processed',
                ),
                const Spacer(),
                Checkbox(
                  value: order.xStudioReferrerProcessed,
                  activeColor: Colors.blue,
                  onChanged: (value) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String getDeliveryStatusMessage(String deliveryStatus) {
  switch (deliveryStatus) {
    case 'full':
      return 'Fully Delivered';
    case 'partial':
      return 'Partially Delivered';
    case 'pending':
      return 'Pending';
    default:
      return '';
  }
}

String getInvoicePaymentStatusMessage(String invoicePaymentStatus) {
  switch (invoicePaymentStatus) {
    case 'paid':
      return 'Paid';
    case 'partial':
      return 'Partial';
    case 'not_paid':
      return 'Not Paid';
    case '0':
      return 'Not Paid';
    case 'false':
      return 'Not Set';
    default:
      return '';
  }
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

Future<void> showSavingManualAdditionDecution(
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
            'Updating Manual Addition/Deduction...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}

Future<void> showModifyManualAdditionDeductionModal(
  BuildContext context,
  AwsSalesOrder order,
  AwsSalesDetailsCubit cubit,
  int userId,
  String name,
  AwsSalesCubit? salesCubit,
) {
  return showDialog(
    barrierColor: Colors.black.withOpacity(0.3),
    context: context,
    builder: (BuildContext dialogCon) => AlertDialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: ModifyManualAdditionDeductionModal(
        order: order,
        cubit: cubit,
        context: context,
        userId: userId,
        name: name,
        salesCubit: salesCubit,
      ),
      //  const Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     CircularProgressIndicator(
      //       color: Color(0xff0083ff),
      //     ),
      //     SizedBox(
      //       width: 16,
      //     ),
      //     Text(
      //       'Updating User Details...',
      //       style: TextStyle(fontSize: 16),
      //     ),
      //   ],
      // ),
    ),
  );
}

class ModifyManualAdditionDeductionModal extends StatefulWidget {
  const ModifyManualAdditionDeductionModal({
    required this.order,
    required this.cubit,
    required this.context,
    required this.userId,
    required this.name,
    required this.salesCubit,
    super.key,
  });
  final BuildContext context;
  final AwsSalesOrder order;
  final AwsSalesDetailsCubit cubit;
  final int userId;
  final String name;
  final AwsSalesCubit? salesCubit;

  @override
  State<ModifyManualAdditionDeductionModal> createState() =>
      _ModifyManualAdditionDeductionModalState();
}

class _ModifyManualAdditionDeductionModalState
    extends State<ModifyManualAdditionDeductionModal> {
  TextEditingController ctrlManualAdditionDeduction = TextEditingController();
  TextEditingController ctrlTextContent = TextEditingController();
  bool isValidating = false;

  @override
  void initState() {
    ctrlManualAdditionDeduction.text =
        (widget.order.additionalDeduction ?? 0).toString();
    ctrlTextContent.text = widget.order.manualNotes ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext _) {
    final context = widget.context;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Modify Manual +/-'),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          ctrl: ctrlManualAdditionDeduction,
          onChanged: (value) {
            setState(() {});
          },
          title: 'Addition/Deduction',
          isValidating: isValidating,
          prioValidate: isValidating,
          customInputFormat: FilteringTextInputFormatter.allow(
            RegExp(r'^-?\d*\.?\d*$'),
          ),
        ),
        const Text(
          'Notes (Optional)',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          controller: ctrlTextContent,
          enableSuggestions: false,
          autocorrect: false,
          minLines: 6,
          maxLines: 10,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0),
            ),
            labelStyle: TextStyle(color: Colors.green),
            hintStyle: TextStyle(color: Color(0xffc3c2c7)),
            hintText: 'Start writing...',
          ),
          onChanged: (value) {
            setState(() {});
          },
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
                  if (!isValidNumber(ctrlManualAdditionDeduction.text)) {
                    setState(() {
                      isValidating = true;
                    });

                    var hehe = 0;
                  } else {
                    setState(() {
                      isValidating = false;
                    });
                    context.pop();
                    unawaited(
                      showSavingManualAdditionDecution(
                        context,
                        //  widget.jobName,
                        // widget.cubit,
                      ),
                    );
                    // final isSaved = await widget.cubit.updateSalesOrder(
                    //   widget.order.copyWith(
                    //     additionalDeduction:
                    //         double.parse(ctrlManualAdditionDeduction.text),
                    //     manualNotes: ctrlTextContent.text,
                    //   ),
                    // );
                    final isSaved = await widget.cubit.updateManualAddition(
                      widget.userId,
                      widget.name,
                      ctrlTextContent.text,
                      double.parse(ctrlManualAdditionDeduction.text),
                    );

                    if (isSaved) {
                      if (context.mounted) {
                        context.pop();
                      }

                      const snackBar = SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          'Successfully updated ' 'manual addition/deduction',
                        ),
                      );

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }

                      var hehe = widget.order;

                      var hihi = widget.order;

                      unawaited(
                        widget.cubit.fetchAwsSalesDetails(
                          widget.order.id!.toString(),
                        ),
                      );

                      try {
                        //  widget.salesCubit.state
                        final loadedState =
                            (widget.salesCubit!.state as AwsSalesStateLoaded)
                                .asData;
                        var hehe = loadedState;
                        await widget.salesCubit!.updateSalesLocal(
                          loadedState.records,
                          widget.order.copyWith(
                            manualNotes: ctrlTextContent.text,
                            additionalDeduction:
                                double.parse(ctrlManualAdditionDeduction.text),
                          ),
                        );
                      } catch (e) {
                        print(e);
                      }
                    } else {
                      if (context.mounted) {
                        context.pop();
                      }

                      const snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content:
                            Text('Failed to update manual addition/deduction.'),
                      );

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
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

Future<void> showEnteredOdooModal(
  BuildContext context,
  AwsSalesOrder order,
  AwsSalesDetailsCubit cubit,
  int userId,
  String name,
  //List<AwsSalesOrder> data,
  //void Function() updateState,
  AwsSalesCubit? salesCubit,
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
        salesCubit: salesCubit,
        // data: data,
        // updateState: updateState,
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
    required this.salesCubit,
    // required this.data,
    // required this.updateState,

    super.key,
  });
  final BuildContext context;
  final AwsSalesOrder order;
  final AwsSalesDetailsCubit cubit;
  final int userId;
  final String name;
  final AwsSalesCubit? salesCubit;
  // final List<AwsSalesOrder> data;
  // final void Function() updateState;

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

                    // try {
                    //   var newCubit = (widget.salesCubit!.state is AwsSalesStateLoaded).asData;

                    //   await widget.salesCubit!.updateSalesLocal(
                    //     widget.data,
                    //     widget.order.copyWith(
                    //       isEnteredOdoo: !widget.order.isEnteredOdoo,
                    //     ),
                    //   );
                    // } catch (e) {}

                    // widget.updateState();
                    unawaited(
                      widget.cubit.fetchAwsSalesDetails(
                        widget.order.id!.toString(),
                      ),
                    );
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

Future<void> showConfirmByManagerModal(
  BuildContext context,
  AwsSalesOrder order,
  AwsSalesDetailsCubit cubit,
  int userId,
  String name,
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
    super.key,
  });
  final BuildContext context;
  final AwsSalesOrder order;
  final AwsSalesDetailsCubit cubit;
  final int userId;
  final String name;

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

                    unawaited(
                      widget.cubit.fetchAwsSalesDetails(
                        widget.order.id!.toString(),
                      ),
                    );
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
