import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_details/view/cloud_sales_details_page.dart';
import 'package:water_analytics_australia/2_application/pages/home_page.dart';
import 'package:water_analytics_australia/2_application/pages/login/view/login_page.dart';
import 'package:water_analytics_australia/2_application/pages/sales/view/sales_page.dart';
import 'package:water_analytics_australia/2_application/pages/sales_details/view/sales_details_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

const String _basePath = '';

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '$_basePath/${LoginPage.name}',
  routes: [
    GoRoute(
      name: LoginPage.name,
      path: LoginPage.path,
      builder: (context, state) {
        return const LoginPageWrapperProvider();
      },
    ),
    GoRoute(
      name: SalesPage.name,
      path: SalesPage.path,
      builder: (context, state) {
        return const SalesPageWrapperProvider();
      },
    ),
    GoRoute(
      name: SalesDetailsPage.name,
      path: SalesDetailsPage.path,
      builder: (context, state) {
        return SalesDetailsPageWrapperProvider(
          id: state.pathParameters['id']!,
        );
      },
    ),
    GoRoute(
      name: HomePage.name,
      path: HomePage.path,
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      name: CloudSalesDetailsPage.name,
      path: CloudSalesDetailsPage.path,
      builder: (context, state) {
        return CloudSalesDetailsPageWrapperProvider(
          id: state.pathParameters['id']!,
        );
      },
    ),
  ],
);
