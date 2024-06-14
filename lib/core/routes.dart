import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:water_analytics_australia/2_application/pages/admin_users/cloud_sales_details/view/admin_users_page.dart';
import 'package:water_analytics_australia/2_application/pages/admin_users_detail_page/view/admin_users_detail_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_detail_page/view/aws_sales_details_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/view/aws_sales_page.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_details/view/cloud_sales_details_page.dart';
import 'package:water_analytics_australia/2_application/pages/create_users_page/view/create_users_page.dart';
import 'package:water_analytics_australia/2_application/pages/home_page.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_detail_page/view/landing_price_detail_page.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_page/view/landing_price_page.dart';
import 'package:water_analytics_australia/2_application/pages/login/view/login_page.dart';
import 'package:water_analytics_australia/2_application/pages/sales/view/sales_page.dart';
import 'package:water_analytics_australia/2_application/pages/sales_details/view/sales_details_page.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

const String _basePath = '';

final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '$_basePath/${HomePage.name}',
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
    GoRoute(
      name: LandingPricePage.name,
      path: LandingPricePage.path,
      builder: (context, state) {
        return const LandingPricePageWrapperProvider();
      },
    ),
    GoRoute(
      name: LandingPriceDetailPage.name,
      path: LandingPriceDetailPage.path,
      builder: (context, state) {
        return LandingPriceDetailPageWrapperProvider(
          id: state.pathParameters['id']!,
        );
      },
    ),
    GoRoute(
      name: AdminUsersPage.name,
      path: AdminUsersPage.path,
      builder: (context, state) {
        return const AdminUsersPageWrapperProvider();
      },
    ),
    GoRoute(
      name: AdminUsersDetailPage.name,
      path: AdminUsersDetailPage.path,
      builder: (context, state) {
        return AdminUsersDetailPageWrapperProvider(
          id: state.pathParameters['id']!,
        );
      },
    ),
    GoRoute(
      name: CreateUsersPage.name,
      path: CreateUsersPage.path,
      builder: (context, state) {
        return const CreateUsersPageWrapperProvider();
      },
    ),
    GoRoute(
      name: AwsSalesPage.name,
      path: AwsSalesPage.path,
      builder: (context, state) {
        return const AwsSalesPageWrapperProvider();
      },
    ),
    GoRoute(
      name: AwsSalesDetailsPage.name,
      path: AwsSalesDetailsPage.path,
      builder: (context, state) {
        return AwsSalesDetailsPageWrapperProvider(
          id: state.pathParameters['id']!,
        );
      },
    ),
    //  GoRoute(
    //   name: AdminUsersDetailPage.name,
    //   path: AdminUsersDetailPage.path,
    //   builder: (context, state) {
    //     return AdminUsersDetailPageWrapperProvider(
    //       id: state.pathParameters['id']!,
    //     );
    //   },
    // ),
  ],
  redirect: (context, state) async {
    // final auth = context.read<AuthCubit>();
    // final onboarded = await auth.getOnboarded();
    // final loggedIn = await auth.getAccessToken() != null;

    // if (!onboarded) return '/onboarding-screen';

    // if (!loggedIn) {
    //   if ('/forgot-password' == state.uri.toString() ||
    //       state.uri.toString().contains('/register')) {
    //     return state.uri.toString();
    //   }

    //   if (state.uri.queryParameters.isEmpty) return '/login';
    // }
    // if (kIsWeb) {
    final userBox = await HiveHelper.openUserBox();
    if (userBox == null || userBox.isEmpty) {
      return LoginPage.path;
    }
    return null;
    //}
    //return null;
  },
);
