// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls, prefer_int_literals

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_admin_users_detail_page/view/aws_admin_users_detail_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_manage_team_detail/view/manage_teams_detail_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_manage_teams/bloc/manage_team_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/member_detail_page/view/member_detail_page.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/widgets/home_end_drawer.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class ManageTeamsWrapperProvider extends StatelessWidget {
  const ManageTeamsWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ManageTeamsCubit>(),
      child: ManageTeams(
        client: sl<OdooClient>(),
      ),
    );
  }
}

class ManageTeams extends StatefulWidget {
  const ManageTeams({required this.client, super.key});

  static const name = 'ManageTeams';
  static const path = '/ManageTeams';

  final OdooClient client;

  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  static void closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  static void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  State<ManageTeams> createState() => _ManageTeamsState();
}

class _ManageTeamsState extends State<ManageTeams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ManageTeams._scaffoldKey,
      endDrawer: const HomeEndDrawer(),
      backgroundColor: const Color(0xfff9fafb),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'Manage Teams',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                ManageTeams._scaffoldKey.currentState!.openEndDrawer(),
            icon: const HeroIcon(
              HeroIcons.bars3,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () => context.read<ManageTeamsCubit>().fetchUsers(),
        child: BlocBuilder<ManageTeamsCubit, ManageTeamsCubitState>(
          builder: (context, state) {
            if (state is ManageTeamsStateLoading) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: ShimmerBox(
                    height: 110,
                  ),
                ),
              );
            } else if (state is ManageTeamsStateLoaded) {
              return ManageTeamsLoaded(
                teams: state.teams,
              );
            } else if (state is ManageTeamsStateError) {
              return ManageTeamsError(
                onRefresh: () => context.read<ManageTeamsCubit>().fetchUsers(),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class ManageTeamsLoaded extends StatefulWidget {
  const ManageTeamsLoaded({required this.teams, super.key});

  final List<List<AwsUser>> teams;

  @override
  State<ManageTeamsLoaded> createState() => _ManageTeamsLoadedState();
}

class _ManageTeamsLoadedState extends State<ManageTeamsLoaded> {
  final ctrlSearch = TextEditingController();

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
      body: ListView.builder(
        itemCount: widget.teams.length,
        itemBuilder: (context, index) {
          final salesManager =
              widget.teams[index].firstWhere((e) => e.accessLevel == 3);

          return ListTile(
            title: Text(
              "${salesManager.displayName.endsWith('s') ? salesManager.displayName : "${salesManager.displayName}'s"} Team",
            ),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              context.pushNamed(
                ManageTeamDetail.name,
                pathParameters: {
                  'id': salesManager.id.toString(),
                  'managerName': salesManager.displayName,
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ManageTeamsError extends StatelessWidget {
  const ManageTeamsError({
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

class MyDataTableSource extends DataTableSource {
  MyDataTableSource(this.data, this.context);
  final List<AwsUser> data;
  final BuildContext context;
  Set<int> selectedRows = {};

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  DataRow getRow(int index) {
    if (index >= rowCount || index < 0) {
      throw Exception('Invalid row index');
    }
    final item = data[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          onTap: () {
            context.pushNamed(
              MemberDetailPage.name,
              pathParameters: {'rep': item.displayName},
            );
          },
          Text(item.displayName),
        ),
        DataCell(
          onTap: () {
            context.pushNamed(
              MemberDetailPage.name,
              pathParameters: {'rep': item.displayName},
            );
          },
          Text(item.email),
        ),
        DataCell(
          onTap: () {},
          Card(
            elevation: 0,
            color: accessLevelToColor(item.accessLevel),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                accessLevelToString(item.accessLevel),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        DataCell(onTap: () {}, Text(item.commissionSplit.toString())),
        DataCell(
          onTap: () {
            context.pushNamed(
              AwsAdminUsersDetailPage.name,
              pathParameters: {'id': item.id.toString()},
            );
          },
          const HeroIcon(
            HeroIcons.pencilSquare,
          ),
        ),
      ],
    );
  }

  @override
  int get selectedRowCount => selectedRows.length;
}
