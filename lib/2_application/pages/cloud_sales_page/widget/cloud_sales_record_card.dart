import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:water_analytics_australia/1_domain/models/cloud_sales_record_model.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_details/view/cloud_sales_details_page.dart';
import 'package:water_analytics_australia/core/helper.dart';

class CloudSalesRecordCard extends StatelessWidget {
  const CloudSalesRecordCard({required this.record, super.key});
  final CloudSalesOrder record;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        CloudSalesDetailsPage.name,
        pathParameters: {'id': record.id.toString()},
      ),
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        border: Border.all(
                          color: record.state == 'sale'
                              ? const Color(0xff2ca444)
                              : const Color(0xffd8dadd),
                        ),
                        color: record.state == 'sale'
                            ? const Color(0xff2ca444)
                            : const Color(0xffd8dadd),
                      ),
                      child: Text(
                        record.state == 'sale' ? 'Sales Order' : 'Cancelled',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: record.state == 'sale'
                              ? Colors.white
                              : Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
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
