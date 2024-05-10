import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_sales_record_model.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_details/bloc/cloud_sales_details_cubit.dart';
import 'package:water_analytics_australia/core/helper.dart';
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
        backgroundColor: const Color(0xff0083ff),
        title: const Text(
          'Detail - Firebase',
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
              ),
            );
          } else if (state is CloudSalesDetailsStateError) {
            return Column(
              children: [
                Expanded(
                  child: DetailPageError(
                    onRefresh: () => context.read<CloudSalesDetailsCubit>()
                      ..fetchCloudSalesDetails(
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

class CloudSalesDetailsPageLoaded extends StatelessWidget {
  const CloudSalesDetailsPageLoaded({required this.order, super.key});

  final CloudSalesOrder order;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CloudSalesDetailsCubit, CloudSalesDetailsCubitState>(
      listener: (context, state) {},
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  '#${order.name}',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
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
                      capitalizeFirstLetter(
                        order.xStudioInvoicePaymentStatus.toString() ==
                                'not_paid'
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
                Row(
                  children: [
                    const Text(
                      'Commission Amount',
                    ),
                    const Spacer(),
                    Text(
                      r'$' + 0.toStringAsFixed(2),
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
                const SizedBox(
                  height: 0,
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  color: const Color(0xfff5faff),
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
                            Row(
                              children: [
                                const Text(
                                  'Sales Rep',
                                ),
                                const Spacer(),
                                Text(
                                  order.xStudioSalesRep1 ?? '',
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
                                  'Sales Source',
                                ),
                                const Spacer(),
                                Text(
                                  order.xStudioSalesSource ?? '',
                                  style: const TextStyle(
                                    color: Color(0xff7a7a7a),
                                  ),
                                ),
                              ],
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
                ),
                const SizedBox(
                  height: 8,
                ),
                if (order.internalNoteDisplay != null) ...[
                  Card(
                    color: const Color(0xfff5faff),
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
