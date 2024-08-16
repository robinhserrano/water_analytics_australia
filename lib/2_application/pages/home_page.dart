import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'package:water_analytics_australia/2_application/pages/aws_admin_users/view/aws_admin_users_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_manage_teams/view/manage_teams_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_my_team/view/my_team_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_product_stocks_page/view/product_stock_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/view/aws_sales_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_report_page/view/sales_report_page.dart';
import 'package:water_analytics_australia/2_application/pages/sales/view/sales_page.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const name = 'home';
  static const path = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int userAccessLevel = 1;
  @override
  void initState() {
    _getUserFromHive();
    super.initState();
  }

  Future<void> _getUserFromHive() async {
    final user = await HiveHelper.getCurrentUser();
    userAccessLevel = user?.accessLevel ?? 1;
    setState(() {});
  }

  int _pageIndex = 0;

  void _tapOnNavigationDestination(BuildContext context, int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = <Widget>[
      const AwsSalesPageWrapperProvider(),
      if (userAccessLevel >= 4 || userAccessLevel == 0) ...[
        const AwsAdminUsersPageWrapperProvider(),
      ],
      if (userAccessLevel >= 2 && userAccessLevel < 4) ...[
        const MyTeamPageWrapperProvider(),
      ],
      if (userAccessLevel >= 4 || userAccessLevel == 0) ...[
        const ManageTeamsWrapperProvider(),
      ],
      if (!kIsWeb) ...[
        const SalesPageWrapperProvider(),
      ],
      // if (userAccessLevel >= 4 || userAccessLevel == 0) ...[
      const ProductStockPageWrapperProvider(),
      if (userAccessLevel >= 4) ...[
        const SalesReportPageWrapperProvider(),
      ],
      // ],
    ];

    final destinations = [
      const NavigationDestination(
        icon: HeroIcon(HeroIcons.home),
        label: 'Home',
      ),
      if (userAccessLevel >= 4 || userAccessLevel == 0) ...[
        const NavigationDestination(
          icon: Icon(FontAwesomeIcons.addressBook),
          label: 'Users',
        ),
      ],
      if (userAccessLevel > 1 && userAccessLevel < 4) ...[
        const NavigationDestination(
          icon: HeroIcon(HeroIcons.userGroup),
          label: 'Team',
        ),
      ],
      if (userAccessLevel >= 4 || userAccessLevel == 0) ...[
        const NavigationDestination(
          icon: Icon(FontAwesomeIcons.usersGear),
          label: 'Manage Team',
        ),
      ],
      if (!kIsWeb) ...[
        const NavigationDestination(
          icon: HeroIcon(HeroIcons.circleStack),
          label: 'Odoo',
        ),
      ],
      // if (userAccessLevel >= 4 || userAccessLevel == 0) ...[
      const NavigationDestination(
        icon: Icon(FontAwesomeIcons.chartBar),
        label: 'Stock',
      ),
      // ],
      if (userAccessLevel >= 4) ...[
        const NavigationDestination(
          icon: HeroIcon(HeroIcons.presentationChartBar),
          label: 'Sales Report',
        ),
      ],
    ];

    return AdaptiveLayout(
      internalAnimations: false,
      primaryNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('primary-navigation-medium'),
            builder: (context) => AdaptiveScaffold.standardNavigationRail(
              backgroundColor: Colors.white,
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
            builder: (_) => screens[_pageIndex],
          ),
        },
      ),
    );
  }
}
