import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:heroicons/heroicons.dart';
import 'package:water_analytics_australia/2_application/pages/admin_users/cloud_sales_details/view/admin_users_page.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_page/view/cloud_sales_page.dart';
import 'package:water_analytics_australia/2_application/pages/sales/view/sales_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const name = 'home';
  static const path = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  final List<Widget> _screens = [
    const CloudSalesPageWrapperProvider(),
    const AdminUsersPageWrapperProvider(),
    if (!kIsWeb) ...[
      const SalesPageWrapperProvider(),
    ]
  ];

  final destinations = [
    const NavigationDestination(
      icon: HeroIcon(HeroIcons.home),
      label: 'Home',
    ),
    const NavigationDestination(
      icon: HeroIcon(HeroIcons.users),
      label: 'Users',
    ),
    if (!kIsWeb) ...[
      const NavigationDestination(
        icon: HeroIcon(HeroIcons.circleStack),
        label: 'Odoo',
      ),
    ]
  ];

  void _tapOnNavigationDestination(BuildContext context, int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      internalAnimations: false,

      primaryNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('primary-navigation-medium'),
            builder: (context) => AdaptiveScaffold.standardNavigationRail(
              backgroundColor: Colors.white,
              // leading: const HeroIcon(HeroIcons.academicCap),
              labelType: NavigationRailLabelType.all,
              onDestinationSelected: (index) =>
                  _tapOnNavigationDestination(context, index),
              selectedIndex: _pageIndex,
              destinations: destinations
                  .map(
                    AdaptiveScaffold.toRailDestination,
                  )
                  .toList(),
            ),
          ),
        },
      ),

      bottomNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('bottom-navigation-small'),
            builder: (_) => AdaptiveScaffold.standardBottomNavigationBar(
              destinations: destinations,
              currentIndex: _pageIndex,
              onDestinationSelected: (value) =>
                  _tapOnNavigationDestination(context, value),
            ),
          ),
        },
      ),
      body: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.smallAndUp: SlotLayout.from(
            key: const Key('primary-body-small'),
            builder: (_) =>
                _screens[_pageIndex], //HomePage.tabs[widget.index].child,
          ),
        },
      ),
      // secondaryBody: SlotLayout(
      //   config: <Breakpoint, SlotLayoutConfig>{
      //     Breakpoints.large: SlotLayout.from(
      //       key: const Key('secondary-body-medium'),
      //     builder: (_){
      //       return Text('aaaaa');
      //     }
      //     //  builder:

      //       // widget.index != 1
      //       //     ? null
      //       //     : (_) => BlocBuilder<NavigationToDoCubit, NavigationToDoCubitState>(
      //       //           builder: (context, state) {
      //       //             final selectedId = state.selectedCollectionId;
      //       //             final isSecondBodyDisplayed = Breakpoints.mediumAndUp.isActive(context);

      //       //             context.read<NavigationToDoCubit>().secondBodyHasChanged(
      //       //                   isSecondBodyDisplayed: isSecondBodyDisplayed,
      //       //                 );

      //       //             if (selectedId == null) {
      //       //               return const Placeholder();
      //       //             }
      //       //             return ToDoDetailPageProvider(
      //       //               key: Key(selectedId.value),
      //       //               collectionId: selectedId,
      //       //             );
      //       //           },
      //       //         ),
      //     ),
      //   },
      // ),
    );
    // return Scaffold(
    //   body: _screens[_pageIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     currentIndex: _pageIndex,
    //     onTap: _onItemTapped,
    //     items: const [
    //       BottomNavigationBarItem(
    //         icon: HeroIcon(HeroIcons.home),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: HeroIcon(HeroIcons.fire),
    //         label: 'Firebase',
    //       ),
    //     ],
    //   ),
    // );
  }
}
