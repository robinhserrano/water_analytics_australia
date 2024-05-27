// ignore_for_file: prefer_int_literals, inference_failure_on_function_return_type, avoid_positional_boolean_parameters

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_details/bloc/cloud_sales_details_cubit.dart';
import 'package:water_analytics_australia/core/temp.dart';
import 'package:water_analytics_australia/core/widgets/cloud_custom_data_table.dart';
import 'package:water_analytics_australia/injection.dart';

class CloudSalesDetailsPageWrapperProvider extends StatelessWidget {
  const CloudSalesDetailsPageWrapperProvider({required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CloudSalesDetailsCubit>(),
      child: CloudSalesDetailsPage(
        id: id,
      ),
    );
  }
}

class CloudSalesDetailsPage extends StatefulWidget {
  const CloudSalesDetailsPage({required this.id, super.key});

  static const name = 'cloudSalesDetail';
  static const path = '/cloudSalesDetail/:id';

  final String id;

  @override
  State<CloudSalesDetailsPage> createState() => _CloudSalesDetailsPageState();
}

class _CloudSalesDetailsPageState extends State<CloudSalesDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<CloudSalesDetailsCubit>().fetchCloudSalesDetails(widget.id);
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
      body: BlocBuilder<CloudSalesDetailsCubit, CloudSalesDetailsCubitState>(
        builder: (context, state) {
          if (state is CloudSalesDetailsStateLoading) {
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
          } else if (state is CloudSalesDetailsStateLoaded) {
            return SingleChildScrollView(
              child: CloudSalesDetailsPageLoaded(
                order: state.order,
                orderLine: state.orderLine,
              ),
            );
          } else if (state is CloudSalesDetailsStateError) {
            return Column(
              children: [
                Expanded(
                  child: DetailPageError(
                    onRefresh: () {
                      context
                          .read<CloudSalesDetailsCubit>()
                          .fetchCloudSalesDetails(widget.id);
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

class CloudSalesDetailsPageLoaded extends HookWidget {
  const CloudSalesDetailsPageLoaded({
    required this.order,
    required this.orderLine,
    super.key,
  });

  final CloudSalesOrder order;
  final List<CloudOrderLines> orderLine;

  @override
  Widget build(BuildContext context) {
    final tabIndex = useState(0);
    final tabCtrl = useTabController(initialLength: 2);

    return BlocListener<CloudSalesDetailsCubit, CloudSalesDetailsCubitState>(
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
                      orderLine: orderLine,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              _TabBar(
                controller: tabCtrl,
                onTabChanged: (value) {
                  tabIndex.value = value;
                },
              ),
              if (tabCtrl.index == 0) ...[
                OrderLines(
                  order: order,
                  orderLine: orderLine,
                ),
              ],
              if (tabCtrl.index == 1) ...[
                Notes(
                  order: order,
                ),
              ],
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

  final CloudSalesOrder order;

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
  final CloudSalesOrder order;

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

  final CloudSalesOrder order;
  final List<CloudOrderLines> orderLine;

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
          child: CloudCustomDataTable(
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

class Notes extends StatelessWidget {
  const Notes({required this.order, super.key});
  final CloudSalesOrder order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          if (order.internalNoteDisplay != null) ...[
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Notes',
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
                    Row(
                      children: [
                        Expanded(
                          child: HtmlWidget(
                            order.internalNoteDisplay ?? '',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
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
    super.key,
  });
  final CloudSalesOrder order;
  final List<CloudOrderLines> orderLine;

  @override
  Widget build(BuildContext context) {
    final sellingPrice = calculateCashPrice(
      order.amountTotal ?? 0,
      (order.xStudioPaymentType ?? '').toLowerCase().contains('cash'),
    );

    final additionalCost = getAdditionalCost(orderLine, landingPrices).fold(
      0.0,
      (prev, e) => prev + (e.taxExcl ?? 0),
    );
    final landingPrice = getLandingPrice(orderLine, landingPrices).fold(
      0.0,
      (prev, e) =>
          prev +
          (e.isSupplyOnly
              ? (e.landingPrice.supplyOnly ?? 0.0)
              : (e.landingPrice.installationService ?? 0.0)),
    );

    final extraCommission = (sellingPrice - landingPrice) * 0.5;

    final baseCommission = (orderLine.any(
      (element) => (element.product ?? '').contains(
        'USRO-6S1-2W'.toLowerCase(),
      ),
    ))
        ? 200
        : (order.xStudioSalesSource ?? '').toLowerCase().contains('self')
            ? 1000
            : 500;
    final finalCommission = extraCommission + baseCommission;

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
            CustomRowTile(
              '(debug) additional_cost',
              r'$' + additionalCost.toStringAsFixed(2),
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
            if (additionalCost <= 0) ...[
              CustomRowTile(
                'Final Commission',
                r'$' + finalCommission.toStringAsFixed(2),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

List<LandingPriceWithQuantity> getLandingPrice(
  List<CloudOrderLines> orderLines,
  List<LandingPrice> landingPrices,
) {
  final matchingLandingPrices = <LandingPriceWithQuantity>{};
  final isSupplyOnly = orderLines.any(
    (orderLine) => orderLine.product?.toLowerCase() == 'supply only',
  );

  for (final orderLine in orderLines) {
    final displayName = orderLine.product;
    final quantity = orderLine.quantity;
    if (displayName != null && quantity != null) {
      for (final landingPrice in landingPrices) {
        if (displayName
            .toLowerCase()
            .contains(landingPrice.internalReference!.toLowerCase())) {
          matchingLandingPrices.add(
            LandingPriceWithQuantity(
              landingPrice: (quantity >= 2 &&
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
  }

  return matchingLandingPrices.toList();
}

List<CloudOrderLines> getAdditionalCost(
  List<CloudOrderLines> orderLines,
  List<LandingPrice> landingPrices,
) {
  final matchingLandingPrices = <LandingPriceWithQuantity>{};
  final isSupplyOnly = orderLines.any(
    (orderLine) => orderLine.product?.toLowerCase() == 'supply only',
  );
  final additionalCostSet = <CloudOrderLines>{};
  final tempAdditionalCostSet = <CloudOrderLines>{};
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

class CloudOrderInfos extends StatelessWidget {
  const CloudOrderInfos({required this.order, super.key});

  final CloudSalesOrder order;

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
                      : DateFormat('MM/dd/yyyy hh:mm a')
                          .format(order.createDate!),
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
    case 'false':
      return 'Not Set';
    default:
      return '';
  }
}
