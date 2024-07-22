import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:water_analytics_australia/1_domain/models/aws_landing_price_model.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_detail_page/view/landing_price_detail_page.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_page/view/landing_price_page.dart';

class AwsLandingPriceCard extends StatelessWidget {
  const AwsLandingPriceCard({required this.record, super.key});
  final AwsLandingPrice record;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        LandingPriceDetailPage.name,
        pathParameters: {
          'id': record.internalReference!,
        },
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
            child: Row(
              children: [
                const HeroIcon(
                  HeroIcons.photo,
                  size: 50,
                  color: Colors.blueGrey,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              record.name ?? '',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '[${record.internalReference}]',
                        style: const TextStyle(color: Color(0xff7a7a7a)),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        r'Installation Service: $',
                        //'${record.installationService.toStringAsFixed(2)}',
                        style: const TextStyle(color: Color(0xff7a7a7a)),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        r'Supply Only: $',
                        //'${record.supplyOnly.toStringAsFixed(2)}',
                        style: const TextStyle(color: Color(0xff7a7a7a)),
                      ),
                    ],
                  ),
                ),
                CustomPopMenu(
                  id: record.internalReference!,
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
