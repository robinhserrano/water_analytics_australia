import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:water_analytics_australia/2_application/pages/admin_users/view/admin_users_page.dart';
import 'package:water_analytics_australia/2_application/pages/admin_users_detail_page/view/admin_users_detail_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_admin_users_detail_page/view/aws_admin_users_detail_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_manage_team_detail/bloc/manage_team_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/aws_manage_team_detail/view/manage_teams_detail_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_manage_teams/view/manage_teams_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_my_team/view/my_team_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_detail_page/view/aws_sales_details_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_page/view/aws_sales_page.dart';
import 'package:water_analytics_australia/2_application/pages/cloud_sales_details/view/cloud_sales_details_page.dart';
import 'package:water_analytics_australia/2_application/pages/create_users_page/view/create_users_page.dart';
import 'package:water_analytics_australia/2_application/pages/home_page.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_detail_page/view/landing_price_detail_page.dart';
import 'package:water_analytics_australia/2_application/pages/landing_price_page/view/landing_price_page.dart';
import 'package:water_analytics_australia/2_application/pages/login/view/login_page.dart';
import 'package:water_analytics_australia/2_application/pages/member_detail_page/view/member_detail_page.dart';
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
      name: CreateUserPage.name,
      path: CreateUserPage.path,
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
    GoRoute(
      name: AwsAdminUsersDetailPage.name,
      path: AwsAdminUsersDetailPage.path,
      builder: (context, state) {
        return AwsAdminUsersDetailPageWrapperProvider(
          id: state.pathParameters['id']!,
        );
      },
    ),
    GoRoute(
      name: MyTeamPage.name,
      path: MyTeamPage.path,
      builder: (context, state) {
        return const MyTeamPageWrapperProvider();
      },
    ),
    GoRoute(
      name: MemberDetailPage.name,
      path: MemberDetailPage.path,
      builder: (context, state) {
        return MemberDetailPageWrapperProvider(
          rep: state.pathParameters['rep']!,
        );
      },
    ),
    GoRoute(
      name: ManageTeams.name,
      path: ManageTeams.path,
      builder: (context, state) {
        return const ManageTeamsWrapperProvider();
      },
    ),
    GoRoute(
      name: ManageTeamDetail.name,
      path: ManageTeamDetail.path,
      builder: (context, state) {
        return ManageTeamDetailWrapperProvider(
          id: state.pathParameters['id']!,
          managerName: state.pathParameters['managerName']!,
        );
      },
    ),
    // GoRoute(
    //   name: ManageTeamDetail.name,
    //   path: ManageTeamDetail.path,
    //   builder: (context, state) {
    //     return const ManageTeamDetailWrapperProvider();
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
    try {
      final userBox = await HiveHelper.openUserBox();
      if (userBox == null || userBox.isEmpty) {
        return LoginPage.path;
      }
      return null;
    } catch (e) {
      print(e);
    }

    //}
    //return null;
  },
);
