// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls, prefer_int_literals

import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:water_analytics_australia/2_application/pages/aws_edit_landing_price_page/view/aws_edit_landing_price_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_landing_price_page/cubit/aws_landing_price_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/aws_landing_price_page/widget/aws_landing_price_card.dart';
import 'package:water_analytics_australia/2_application/pages/aws_landing_price_page/widget/create_landing_price_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_landing_price_page/widget/edit_landing_price_page.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_detail_page/view/landing_price_detail_page.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class AwsLandingPricePageWrapperProvider extends StatelessWidget {
  const AwsLandingPricePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AwsLandingPriceCubit>(),
      child: AwsLandingPricePage(
        client: sl<OdooClient>(),
      ),
    );
  }
}

class AwsLandingPricePage extends StatefulWidget {
  const AwsLandingPricePage({required this.client, super.key});

  static const name = 'awsLandingPrice';
  static const path = '/awsLandingPrice';

  final OdooClient client;

  @override
  State<AwsLandingPricePage> createState() => _AwsLandingPricePageState();
}

class _AwsLandingPricePageState extends State<AwsLandingPricePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ctrlSearch = TextEditingController();
  int? id;

  Widget endDrawer({int? id}) {
    final canEdit = id != null;

    return Drawer(
      width: 500,
      child: canEdit
          ? EditLandingPricePageProvider(
              // cubit: context.read<AwsLandingPriceCubit>(),
              onLandingPriceEdited: () {
                context.read<AwsLandingPriceCubit>().fetchAwsLandingPrices();
              },
              id: id,
            )
          : CreateLandingPrice(
              cubit: context.read<AwsLandingPriceCubit>(),
              onLandingPriceCreated: () {
                context.read<AwsLandingPriceCubit>().fetchAwsLandingPrices();
              },
            ),
    );
  }

  Widget searchBox() {
    return Container(
      width: ResponsiveValue(
        context,
        conditionalValues: [
          const Condition.smallerThan(name: TABLET, value: 240.0),
          const Condition.equals(name: TABLET, value: 240.0),
          const Condition.largerThan(name: TABLET, value: 600.0),
        ],
      ).value,
      decoration: const BoxDecoration(
        color: Color(0xffeeeef0),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: TextFormField(
        controller: ctrlSearch,
        enableSuggestions: false,
        autocorrect: false,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelStyle: TextStyle(color: Colors.green),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Color(0xff5f5f60),
            fontWeight: FontWeight.w400,
          ),
        ),
        onChanged: (value) {
          setState(() {});
        },
        onEditingComplete: () {},
        onFieldSubmitted: (value) {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xfff9fafb),
      appBar: AppBar(
        backgroundColor: Colors.black, // const Color(0xff0083ff),
        title: const Text(
          'AWS Landing Price',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () =>
            context.read<AwsLandingPriceCubit>().fetchAwsLandingPrices(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: BlocBuilder<AwsLandingPriceCubit, AwsLandingPriceCubitState>(
            builder: (context, state) {
              if (state is AwsLandingPriceStateLoading) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: ShimmerBox(
                      height: 110,
                    ),
                  ),
                );
              } else if (state is AwsLandingPriceStateLoaded) {
                return Scaffold(
                  endDrawer: endDrawer(id: id),
                  backgroundColor: const Color(0xfff9fafb),
                  body: state.records.isEmpty
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                searchBox(),
                                Builder(
                                  builder: (context) => ElevatedButton.icon(
                                    icon: const HeroIcon(HeroIcons.plus),
                                    onPressed: () {
                                      setState(() {
                                        id = null;
                                      });

                                      Scaffold.of(context).openEndDrawer();
                                    },
                                    label: const Text('Create'),
                                  ),
                                ),
                              ],
                            ),
                            const Center(
                              child: Center(
                                child: Text('No sales yet.'),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                searchBox(),
                                Builder(
                                  builder: (context) => ElevatedButton.icon(
                                    icon: const HeroIcon(HeroIcons.plus),
                                    onPressed: () {
                                      setState(() {
                                        id = null;
                                      });

                                      Scaffold.of(context).openEndDrawer();
                                    },
                                    label: const Text('Create'),
                                  ),
                                ),
                              ],
                            ),
                            // Container(
                            //   decoration: const BoxDecoration(
                            //     color: Color(0xffeeeef0),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(8)),
                            //   ),
                            //   padding: const EdgeInsets.symmetric(
                            //     horizontal: 16,
                            //   ),
                            //   margin: const EdgeInsets.symmetric(
                            //     horizontal: 16,
                            //     vertical: 8,
                            //   ),
                            //   child: TextFormField(
                            //     controller: ctrlSearch,
                            //     enableSuggestions: false,
                            //     autocorrect: false,
                            //     decoration: const InputDecoration(
                            //       border: InputBorder.none,
                            //       labelStyle: TextStyle(color: Colors.green),
                            //       hintText: 'Search',
                            //       hintStyle: TextStyle(
                            //         color: Color(0xff5f5f60),
                            //         fontWeight: FontWeight.w400,
                            //       ),
                            //     ),
                            //     onChanged: (value) {
                            //       setState(() {});
                            //     },
                            //     onEditingComplete: () {},
                            //     onFieldSubmitted: (value) {},
                            //   ),
                            // ),
                            Expanded(
                              child: Scrollbar(
                                child: ListView.builder(
                                  itemCount: state.records.length,
                                  itemBuilder: (context, index) {
                                    final record = state.records[index];
                                    if ((record.name ?? '')
                                            .toLowerCase()
                                            .contains(
                                              ctrlSearch.text.toLowerCase(),
                                            ) ||
                                        (record.internalReference ?? '')
                                            .toLowerCase()
                                            .contains(
                                              ctrlSearch.text.toLowerCase(),
                                            )) {
                                      return AwsLandingPriceCard(
                                        record: record,
                                        insertLandingPriceId: (int value) {
                                          setState(() {
                                            id = value;
                                            Scaffold.of(context)
                                                .openEndDrawer();
                                          });
                                        },
                                      );
                                    }

                                    return const SizedBox();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                );
              } else if (state is AwsLandingPriceStateError) {
                return SalesListPageError(
                  onRefresh: () => context
                      .read<AwsLandingPriceCubit>()
                      .fetchAwsLandingPrices(),
                );
              }
              return const SizedBox();
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

// class CustomPopMenu extends StatefulWidget {
//   const CustomPopMenu({
//     required this.id,
//     super.key,
//   });

//   final String id;

//   @override
//   State<CustomPopMenu> createState() => _CustomPopMenuState();
// }

// class _CustomPopMenuState extends State<CustomPopMenu> {
//   CustomPopupMenuController controller = CustomPopupMenuController();

//   @override
//   Widget build(BuildContext context) {
//     final menuItems = <ItemModel>[
//       const ItemModel('Edit Landing Price', HeroIcons.documentDuplicate, 0),
//       const ItemModel('Delete Landing Price', HeroIcons.trash, 1),
//     ];

//     return CustomPopupMenu(
//       arrowColor: Colors.white,
//       menuBuilder: () => ClipRRect(
//         borderRadius: BorderRadius.circular(5),
//         child: ColoredBox(
//           color: Colors.white,
//           child: IntrinsicWidth(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: menuItems
//                   .map(
//                     (item) => GestureDetector(
//                       behavior: HitTestBehavior.translucent,
//                       onTap: () {
//                         controller.hideMenu();

//                         if (item.index == 0) {
//                           context.pushNamed(
//                             LandingPriceDetailPage.name,
//                             pathParameters: {
//                               'id': widget.id,
//                             },
//                           );
//                         }
//                       },
//                       child: Container(
//                         height: 40,
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Container(
//                           margin: const EdgeInsets.only(left: 10),
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: Row(
//                             children: [
//                               Text(
//                                 item.title,
//                                 style: TextStyle(
//                                   color: item.index == 1
//                                       ? const Color(0xffD92D20)
//                                       : const Color(0xff1D2939),
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                   .toList(),
//             ),
//           ),
//         ),
//       ),
//       pressType: PressType.singleClick,
//       verticalMargin: -10,
//       controller: controller,
//       child: const Icon(Icons.more_vert, color: Color(0xff0F172A)),
//     );
//   }
// }

// class ItemModel {
//   const ItemModel(this.title, this.icon, this.index);
//   final String title;
//   final HeroIcons icon;
//   final int index;
// }
