// ignore_for_file: inference_failure_on_function_return_type, prefer_int_literals, avoid_positional_boolean_parameters

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:water_analytics_australia/1_domain/models/landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';
import 'package:water_analytics_australia/2_application/pages/sales_details/bloc/sales_details_cubit.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/temp.dart';
import 'package:water_analytics_australia/core/widgets/custom_data_table.dart';
import 'package:water_analytics_australia/injection.dart';

class SalesDetailsPageWrapperProvider extends StatelessWidget {
  const SalesDetailsPageWrapperProvider({required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SalesDetailsCubit>(),
      child: SalesDetailsPage(
        id: id,
      ),
    );
  }
}

class SalesDetailsPage extends StatefulWidget {
  const SalesDetailsPage({required this.id, super.key});

  static const name = 'salesDetail';
  static const path = '/salesDetail/:id';

  final String id;

  @override
  State<SalesDetailsPage> createState() => _SalesDetailsPageState();
}

class _SalesDetailsPageState extends State<SalesDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SalesDetailsCubit>().fetchSalesDetails(widget.id);
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
        actions: [
          BlocBuilder<SalesDetailsCubit, SalesDetailsCubitState>(
            builder: (context, state) {
              if (state is SalesDetailsStateLoaded) {
                return Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final success = await context
                            .read<SalesDetailsCubit>()
                            .saveSales(state.order);
                        if (success) {
                          const snackBar = SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Successfully saved order.'),
                          );

                          if (context.mounted) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {
                          const snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Failed to save order.'),
                          );

                          if (context.mounted) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      },
                      icon: const HeroIcon(
                        HeroIcons.arrowUpTray,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final success = await context
                            .read<SalesDetailsCubit>()
                            .saveSalesAws(state.order);
                        if (success) {
                          const snackBar = SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Successfully saved order.'),
                          );

                          if (context.mounted) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {
                          const snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Failed to save order.'),
                          );

                          if (context.mounted) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      },
                      icon: const HeroIcon(
                        HeroIcons.arrowUpOnSquareStack,
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      body: BlocBuilder<SalesDetailsCubit, SalesDetailsCubitState>(
        builder: (context, state) {
          if (state is SalesDetailsStateLoading) {
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
          } else if (state is SalesDetailsStateLoaded) {
            return SingleChildScrollView(
              child: SalesDetailsPageLoaded(
                order: state.order,
              ),
            );
          } else if (state is SalesDetailsStateError) {
            return Column(
              children: [
                Expanded(
                  child: DetailPageError(
                    onRefresh: () => context.read<SalesDetailsCubit>()
                      ..fetchSalesDetails(
                        widget.id,
                      ),
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

class SalesDetailsPageLoaded extends HookWidget {
  const SalesDetailsPageLoaded({required this.order, super.key});

  final SalesOrder order;

  @override
  Widget build(BuildContext context) {
    final tabIndex = useState(0);
    final tabCtrl = useTabController(initialLength: 3);

    return BlocListener<SalesDetailsCubit, SalesDetailsCubitState>(
      listener: (context, state) {},
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    '#${order.name}',
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 12),
                OrderInfos(
                  order: order,
                ),
                CustomerInfoSection(
                  order: order,
                ),
                const SizedBox(
                  height: 8,
                ),
                SalesInformationSection(
                  order: order,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CommissionSection(
            order: order,
          ),
          _TabBar(
            controller: tabCtrl,
            onTabChanged: (value) {
              tabIndex.value = value;
            },
          ),
          if (tabCtrl.index == 0) ...[
            OrderLines(order: order),
          ],
          if (tabCtrl.index == 1) ...[
            OtherInfo(
              order: order,
            ),
          ],
          if (tabCtrl.index == 2) ...[
            Notes(
              order: order,
            ),
          ],
        ],
      ),
    );
  }
}

class OrderInfos extends StatelessWidget {
  const OrderInfos({required this.order, super.key});

  final SalesOrder order;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              order.xStudioPaymentType,
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
              capitalizeFirstLetter(
                order.xStudioInvoicePaymentStatus.toString() == 'not_paid'
                    ? 'Not Paid'
                    : order.xStudioInvoicePaymentStatus.toString(),
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
              capitalizeFirstLetter(
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
        Tab(text: 'Other Info'),
        Tab(text: 'Notes'),
      ],
    );
  }
}

class CustomerInfoSection extends StatelessWidget {
  const CustomerInfoSection({required this.order, super.key});

  final SalesOrder order;

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
                    order.partnerId?.displayName ?? '',
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
                    (order.partnerId?.contactAddress ?? '').toString(),
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
                    (order.partnerId?.phone ?? '').toString(),
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
  final SalesOrder order;

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
                  order.xStudioSalesSource,
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

class CommissionSection extends StatelessWidget {
  const CommissionSection({required this.order, super.key});
  final SalesOrder order;

  @override
  Widget build(BuildContext context) {
    final sellingPrice = calculateCashPrice(
      order.taxTotals?.amountTotal ?? 0,
      order.xStudioPaymentType.toLowerCase().contains('cash'),
    );

    final additionalCost =
        getAdditionalCost(order.orderLine ?? [], landingPrices).fold(
      0.0,
      (prev, e) => prev + (e.priceUnit ?? 0),
    );
    final landingPrice =
        getLandingPrice(order.orderLine ?? [], landingPrices).fold(
      0.0,
      (prev, e) =>
          prev +
          (e.isSupplyOnly
              ? (e.landingPrice.supplyOnly ?? 0.0)
              : (e.landingPrice.installationService ?? 0.0)),
    );

    final temp = (sellingPrice - additionalCost) - landingPrice;
    final extraCommission = temp <= 0 ? temp : temp * 0.5;

    final baseCommission = ((order.orderLine ?? []).any(
      (element) => (element.name ?? '').contains(
        'USRO-6S1-2W'.toLowerCase(),
      ),
    ))
        ? 200
        : order.xStudioSalesSource.toLowerCase().contains('self')
            ? 1000
            : 500;
    final finalCommission = extraCommission + baseCommission;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
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
                    '(debug) additional_deduction',
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
              //  if (additionalCost <= 0) ...[
              CustomRowTile(
                'Final Commission',
                r'$' + finalCommission.toStringAsFixed(2),
              ),
              //   ],
            ],
          ),
        ),
      ),
    );
  }
}

class OrderLines extends StatelessWidget {
  const OrderLines({required this.order, super.key});

  final SalesOrder order;

  @override
  Widget build(BuildContext context) {
    if (order.orderLine == null) return const SizedBox(height: 16);

    var totalDescriptionLength = 0;
    final totalItems = order.orderLine!.length;

    for (final line in order.orderLine!) {
      final descriptionLength = line.name?.length ?? 0;
      totalDescriptionLength += descriptionLength;
    }

    final averageDescriptionLength = totalDescriptionLength / totalItems;
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: ((order.orderLine!.length + 1) * 80) +
              (averageDescriptionLength < 40 ? 0 : averageDescriptionLength),
          child: CustomDataTable(
            data: order.orderLine ?? [],
            total: order.orderLine?.length ?? 0,
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
                    r'$' +
                        (order.taxTotals?.amountUntaxed ?? 0.0)
                            .toStringAsFixed(2),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    r'$' +
                        ((order.taxTotals?.amountTotal ?? 0.0) -
                                (order.taxTotals?.amountUntaxed ?? 0.0))
                            .toStringAsFixed(2),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    r'$' +
                        (order.taxTotals?.amountTotal ?? 0.0)
                            .toStringAsFixed(2),
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
  final SalesOrder order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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

List<LandingPriceWithQuantity> getLandingPrice(
  List<OrderLine> orderLines,
  List<LandingPrice> landingPrices,
) {
  final matchingLandingPrices = <LandingPriceWithQuantity>{};
  final isSupplyOnly = orderLines.any(
    (orderLine) =>
        orderLine.productTemplateId?.displayName?.toLowerCase() ==
        'supply only',
  );

  for (final orderLine in orderLines) {
    final displayName = orderLine.productTemplateId?.displayName;
    final quantity = orderLine.productUomQty;
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
              quantity: quantity,
              isSupplyOnly: isSupplyOnly,
            ),
          );

          break;
        }
      }
    }
  }

  var hehe = matchingLandingPrices.toList();
  var haha = hehe;
  return hehe;
}

List<OrderLine> getAdditionalCost(
  List<OrderLine> orderLines,
  List<LandingPrice> landingPrices,
) {
  final matchingLandingPrices = <LandingPriceWithQuantity>{};
  final isSupplyOnly = orderLines.any(
    (orderLine) =>
        orderLine.productTemplateId?.displayName?.toLowerCase() ==
        'supply only',
  );
  final additionalCostSet = <OrderLine>{};
  final tempAdditionalCostSet = <OrderLine>{};
  for (final orderLine in orderLines) {
    final displayName = orderLine.productTemplateId?.displayName;
    final quantity = orderLine.productUomQty;
    if (displayName != null && quantity != null) {
      for (final landingPrice in landingPrices) {
        if (displayName
            .toLowerCase()
            .contains(landingPrice.internalReference!.toLowerCase())) {
          matchingLandingPrices.add(
            LandingPriceWithQuantity(
              landingPrice: landingPrice,
              quantity: quantity,
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
    final displayName = item.productTemplateId?.displayName ?? '';
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

  //final additionalCostList = additionalCostSet.toList()..removeAt(0);

  final additionalCostList = additionalCostSet.toList()
    ..removeWhere(
      (item) =>
          ((item.productTemplateId?.displayName ?? '')
              .toLowerCase()
              .contains('installation service')) ||
          (item.productTemplateId?.displayName ?? '')
              .toLowerCase()
              .contains('supply only'),
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
