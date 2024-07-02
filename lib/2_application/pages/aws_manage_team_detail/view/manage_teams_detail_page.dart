// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls, prefer_int_literals

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:water_analytics_australia/0_data/repository.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_admin_users_detail_page/view/aws_admin_users_detail_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_manage_team_detail/bloc/manage_team_detail_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/member_detail_page/view/member_detail_page.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';
import 'package:water_analytics_australia/core/widgets/home_end_drawer.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class ManageTeamDetailWrapperProvider extends StatelessWidget {
  const ManageTeamDetailWrapperProvider({
    required this.id,
    required this.managerName,
    super.key,
  });
  final String id;
  final String managerName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageTeamDetailCubit(
        repo: sl<Repository>(),
        managerId: id,
      ),
      child: ManageTeamDetail(
        id: id,
        managerName: managerName,
      ),
    );
  }
}

class ManageTeamDetail extends StatefulWidget {
  const ManageTeamDetail({
    required this.id,
    required this.managerName,
    super.key,
  });

  static const name = 'ManageTeamDetail';
  static const path = '/ManageTeamDetail/:id/:managerName';

  final String id;
  final String managerName;

  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  static void closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  static void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  State<ManageTeamDetail> createState() => _ManageTeamDetailState();
}

class _ManageTeamDetailState extends State<ManageTeamDetail> {
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
      key: ManageTeamDetail._scaffoldKey,
      endDrawer: const HomeEndDrawer(),
      backgroundColor: const Color(0xfff9fafb),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "${widget.managerName.endsWith('s') ? widget.managerName : "${widget.managerName}'s"}' Team",
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                ManageTeamDetail._scaffoldKey.currentState!.openEndDrawer(),
            icon: const HeroIcon(
              HeroIcons.bars3,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () => context.read<ManageTeamDetailCubit>().fetchUsers(),
        child: BlocBuilder<ManageTeamDetailCubit, ManageTeamDetailCubitState>(
          builder: (context, state) {
            if (state is ManageTeamDetailStateLoading) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: ShimmerBox(
                    height: 110,
                  ),
                ),
              );
            } else if (state is ManageTeamDetailStateLoaded) {
              return ManageTeamDetailLoaded(
                team: state.team,
                userAccessLevel: userAccessLevel,
              );
            } else if (state is ManageTeamDetailStateError) {
              return ManageTeamDetailError(
                onRefresh: () =>
                    context.read<ManageTeamDetailCubit>().fetchUsers(),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class ManageTeamDetailLoaded extends StatefulWidget {
  const ManageTeamDetailLoaded({
    required this.team,
    required this.userAccessLevel,
    super.key,
  });

  final List<AwsUser> team;
  final int userAccessLevel;

  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  static void closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  static void openDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  State<ManageTeamDetailLoaded> createState() => _ManageTeamDetailLoadedState();
}

class _ManageTeamDetailLoadedState extends State<ManageTeamDetailLoaded> {
  final ctrlSearch = TextEditingController();
  int _rowsPerPage = 50;
  int? id;

  Widget? endDrawer({int? id}) {
    final canEdit = id != null;

    return canEdit
        ? Drawer(
            width: 500,
            child: AwsAdminUsersDetailPageWrapperProvider(
              id: id.toString(),
              onUserUpdate: () {
                context.read<ManageTeamDetailCubit>().fetchUsers();
              },
            ),
          )
        : null;
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
      key: ManageTeamDetailLoaded._scaffoldKey,
      endDrawer: endDrawer(id: id),
      body: Column(
        children: [
          //  Text(widget.team.toString()),
          Expanded(
            child: PaginatedDataTable2(
              availableRowsPerPage: const [2, 5, 10, 15, 20, 30, 50, 100],
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
                const DataColumn(
                  label: Text('Name'),
                ),
                const DataColumn(label: Text('Email')),
                const DataColumn(label: Text('Role')),
                const DataColumn(label: Text('Commission %')),
                if (widget.userAccessLevel >= 3) ...[
                  const DataColumn(label: Text('Actions')),
                ],
              ],
              source: MyDataTableSource(
                  widget.team, context, widget.userAccessLevel, (int value) {
                setState(() {
                  id = value;
                  ManageTeamDetailLoaded.openDrawer();
                });
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class ManageTeamDetailError extends StatelessWidget {
  const ManageTeamDetailError({
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
  MyDataTableSource(
    this.data,
    this.context,
    this.userAccessLevel,
    this.insertUserId,
  );
  final List<AwsUser> data;
  final BuildContext context;
  final int userAccessLevel;
  void Function(int value) insertUserId;
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
        if (userAccessLevel >= 3) ...[
          DataCell(
            onTap: () {
              insertUserId(item.id);
            },
            const HeroIcon(
              HeroIcons.pencilSquare,
            ),
          ),
          // DataCell(
          //   onTap: () {
          //     context.pushNamed(
          //       AwsAdminUsersDetailPage.name,
          //       pathParameters: {'id': item.id.toString()},
          //     );
          //   },
          //   const HeroIcon(
          //     HeroIcons.pencilSquare,
          //   ),
          // ),
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
