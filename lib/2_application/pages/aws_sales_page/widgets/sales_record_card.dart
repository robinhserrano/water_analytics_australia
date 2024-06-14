import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_detail_page/view/aws_sales_details_page.dart';
import 'package:water_analytics_australia/2_application/pages/sales_details/view/sales_details_page.dart';
import 'package:water_analytics_australia/core/helper.dart';

class SalesRecordCard extends StatelessWidget {
  const SalesRecordCard({required this.record, super.key});
  final AwsSalesOrder record;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        AwsSalesDetailsPage.name,
        pathParameters: {'id': record.id.toString()},
      ),
      // onTap: (){
      //   print('dahfjkdashfdkasjhfkjads');
      // },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Color(0xffdddfe2)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        record.partnerIdDisplayName ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      formatCurrency(record.amountToInvoice ?? 0),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            '${record.name}',
                            style: const TextStyle(color: Color(0xff7a7a7a)),
                          ),
                          const Text(
                            ' - ',
                            style: TextStyle(color: Color(0xff7a7a7a)),
                          ),
                          Text(
                            record.createDate == null
                                ? ''
                                : DateFormat('MM/dd/yyyy hh:mm a')
                                    .format(record.createDate!),
                            style: const TextStyle(color: Color(0xff7a7a7a)),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //     vertical: 4,
                    //     horizontal: 8,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(
                    //       20,
                    //     ),
                    //     border: Border.all(
                    //       color: record.state == 'sale'
                    //           ? const Color(0xff2ca444)
                    //           : const Color(0xffd8dadd),
                    //     ),
                    //     color: record.state == 'sale'
                    //         ? const Color(0xff2ca444)
                    //         : const Color(0xffd8dadd),
                    //   ),
                    //   child: Text(
                    //     record.state == 'sale' ? 'Sales Order' : 'Cancelled',
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.w400,
                    //       color: record.state == 'sale'
                    //           ? Colors.white
                    //           : Colors.black87,
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //     vertical: 4,
                    //     horizontal: 8,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(
                    //       20,
                    //     ),
                    //     border: Border.all(
                    //       color: record.state == 'sale'
                    //           ? const Color(0xff2ca444)
                    //           : const Color(0xffd8dadd),
                    //     ),
                    //     color: record.state == 'sale'
                    //         ? const Color(0xff2ca444)
                    //         : const Color(0xffd8dadd),
                    //   ),
                    //   child: Text(
                    //     record.tagIds?[0].displayName ?? 'NONE',
                    //     // record.state == 'sale' ? 'Sales Order' : 'Cancelled',
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.w400,
                    //       color: record.state == 'sale'
                    //           ? Colors.white
                    //           : Colors.black87,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Commissions Paid',
                    ),
                    const Spacer(),
                    Checkbox(
                      value: record.xStudioCommissionPaid,
                      activeColor: Colors.blue,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Invoice Payment Status',
                    ),
                    const Spacer(),
                    Text(
                      (record.xStudioInvoicePaymentStatus ?? '').toString(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Delivery Status',
                    ),
                    const Spacer(),
                    Text(
                      // capitalizeFirstLetter(
                      (record.deliveryStatus ?? '').toString(),
                      // ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                // Text('Referred by '
                //     '${record.xStudioReferredBy.displayName ?? ''}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customCard(Widget child) {
  return Column(
    children: [
      Card(
        color: const Color(0xfff5faff),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            children: [
              const Text(
                'Job Details',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 4,
              ),
              child,
            ],
          ),
        ),
      ),
    ],
  );
}
