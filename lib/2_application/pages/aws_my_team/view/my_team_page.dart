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
import 'package:water_analytics_australia/2_application/pages/aws_my_team/bloc/my_team_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/member_detail_page/view/member_detail_page.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';
import 'package:water_analytics_australia/core/widgets/home_end_drawer.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class MyTeamPageWrapperProvider extends StatelessWidget {
  const MyTeamPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MyTeamCubit>(),
      child: MyTeamPage(
        client: sl<OdooClient>(),
      ),
    );
  }
}

class MyTeamPage extends StatefulWidget {
  const MyTeamPage({required this.client, super.key});

  static const name = 'myTeam';
  static const path = '/myTeam';

  final OdooClient client;

  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  static void closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  static void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  State<MyTeamPage> createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: MyTeamPage._scaffoldKey,
      endDrawer: const HomeEndDrawer(),
      backgroundColor: const Color(0xfff9fafb),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'My Team',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                MyTeamPage._scaffoldKey.currentState!.openEndDrawer(),
            icon: const HeroIcon(
              HeroIcons.bars3,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () => context.read<MyTeamCubit>().fetchUsers(),
        child: BlocBuilder<MyTeamCubit, MyTeamCubitState>(
          builder: (context, state) {
            if (state is MyTeamStateLoading) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: ShimmerBox(
                    height: 110,
                  ),
                ),
              );
            } else if (state is MyTeamStateLoaded) {
              return MyTeamPageLoaded(
                users: state.users,
                userAccessLevel: userAccessLevel,
              );
            } else if (state is MyTeamStateError) {
              return MyTeamPageError(
                onRefresh: () => context.read<MyTeamCubit>().fetchUsers(),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class MyTeamPageLoaded extends StatefulWidget {
  const MyTeamPageLoaded({
    required this.users,
    required this.userAccessLevel,
    super.key,
  });

  final List<AwsUser> users;
  final int userAccessLevel;

  @override
  State<MyTeamPageLoaded> createState() => _MyTeamPageLoadedState();
}

class _MyTeamPageLoadedState extends State<MyTeamPageLoaded> {
  final ctrlSearch = TextEditingController();
  int _rowsPerPage = 10;

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
      backgroundColor: Colors.white,
      body: widget.users.isEmpty
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    searchBox(),
                  ],
                ),
                const Expanded(
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
                  ],
                ),
                Expanded(
                  child: PaginatedDataTable2(
                    availableRowsPerPage: const [2, 5, 10, 15, 20, 30, 50],
                    rowsPerPage: _rowsPerPage,
                    onRowsPerPageChanged: (value) {
                      setState(() {
                        if (value != null) {
                          _rowsPerPage = value;
                        }
                      });
                    },
                    minWidth: 1200,
                    columns: [
                      const DataColumn(label: Text('Name')),
                      const DataColumn(label: Text('Email')),
                      const DataColumn(label: Text('Role')),
                      const DataColumn(label: Text('Commission %')),
                      if (widget.userAccessLevel >= 3) ...[
                        const DataColumn(label: Text('Actions')),
                      ],
                    ],
                    source: MyDataTableSource(
                      widget.users,
                      context,
                      widget.userAccessLevel,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class MyTeamPageError extends StatelessWidget {
  const MyTeamPageError({
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
  MyDataTableSource(this.data, this.context, this.userAccessLevel);
  final List<AwsUser> data;
  final BuildContext context;
  final int userAccessLevel;
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
          Row(
            children: [
              if (getLevel2SalesManagerName(data, item) != null) ...[
                Padding(
                  padding: const EdgeInsets.only(
                    right: 8.0,
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Text(
                      getInitials(
                        name: getLevel2SalesManagerName(data, item) ?? '',
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
              Text(item.displayName),
            ],
          ),
        ),
        DataCell(onTap: () {}, Text(item.email)),
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
        if (userAccessLevel >= 3) ...[
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
      ],
    );
  }

  @override
  int get selectedRowCount => selectedRows.length;
}

String getInitials({required String name}) {
  if (name.isEmpty) return '';

  final words = name.split(' ');
  return words.take(2).map((word) => word[0]).join().toUpperCase();
}

String? getLevel2SalesManagerName(List<AwsUser> users, AwsUser currentUser) {
  // final user = users.firstWhere((u) => u.id == userId);
  if (currentUser.accessLevel >= 3 || currentUser.salesManagerId == null) {
    return null;
  }

  final manager = users.firstWhere((u) => u.id == currentUser.salesManagerId);
  if (manager.accessLevel != 2) {
    return null;
  }

  return manager.displayName;
}
