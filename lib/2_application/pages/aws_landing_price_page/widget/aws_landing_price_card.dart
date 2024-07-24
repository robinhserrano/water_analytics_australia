import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:water_analytics_australia/1_domain/models/aws_landing_price_model.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_detail_page/view/landing_price_detail_page.dart';

class AwsLandingPriceCard extends StatelessWidget {
  const AwsLandingPriceCard({
    required this.record,
    required this.insertLandingPriceId,
    super.key,
  });
  final AwsLandingPrice record;
  final void Function(int value) insertLandingPriceId;

  @override
  Widget build(BuildContext context) {
    final history = record.history!.toList()
      ..sort(
        (a, b) => b.recordedAt!.compareTo(a.recordedAt!),
      );

    return GestureDetector(
      onTap: () {},
      // context.pushNamed(
      //   LandingPriceDetailPage.name,
      //   pathParameters: {
      //     'id': record.internalReference!,
      //   },
      // ),
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
                        r'Installation Service: $' +
                            (history.first.installationService ?? 0)
                                .toStringAsFixed(2),
                        style: const TextStyle(color: Color(0xff7a7a7a)),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        r'Supply Only: $' +
                            (history.first.supplyOnly ?? 0).toStringAsFixed(2),
                        style: const TextStyle(color: Color(0xff7a7a7a)),
                      ),
                    ],
                  ),
                ),
                CustomPopMenu(
                  id: record.id,
                  insertLandingPriceId: insertLandingPriceId,
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

class CustomPopMenu extends StatefulWidget {
  const CustomPopMenu({
    required this.id,
    required this.insertLandingPriceId,
    super.key,
  });

  final int id;
  final void Function(int value) insertLandingPriceId;

  @override
  State<CustomPopMenu> createState() => _CustomPopMenuState();
}

class _CustomPopMenuState extends State<CustomPopMenu> {
  CustomPopupMenuController controller = CustomPopupMenuController();

  @override
  Widget build(BuildContext context) {
    final menuItems = <ItemModel>[
      const ItemModel('Edit Landing Price', HeroIcons.documentDuplicate, 0),
      const ItemModel('Delete Landing Price', HeroIcons.trash, 1),
    ];

    return CustomPopupMenu(
      arrowColor: Colors.white,
      menuBuilder: () => ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: ColoredBox(
          color: Colors.white,
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: menuItems
                  .map(
                    (item) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        controller.hideMenu();

                        if (item.index == 0) {
                          widget.insertLandingPriceId(widget.id);
                        }
                        if (item.index == 1) {
                          showGeneralDialog(
                            context: context,
                            pageBuilder: (_, __, ___) => const Center(),
                          );
                        }
                      },
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  color: item.index == 1
                                      ? const Color(0xffD92D20)
                                      : const Color(0xff1D2939),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
      pressType: PressType.singleClick,
      verticalMargin: -10,
      controller: controller,
      child: const Icon(Icons.more_vert, color: Color(0xff0F172A)),
    );
  }
}

class ItemModel {
  const ItemModel(this.title, this.icon, this.index);
  final String title;
  final HeroIcons icon;
  final int index;
}
