// ignore_for_file: inference_failure_on_collection_literal, avoid_dynamic_calls, prefer_int_literals, directives_ordering

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_admin_users_detail_page/view/aws_admin_users_detail_page.dart';
import 'package:water_analytics_australia/2_application/pages/aws_admin_users/bloc/aws_admin_users_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/create_users_page/view/create_users_page.dart';
import 'package:water_analytics_australia/2_application/pages/member_detail_page/view/member_detail_page.dart';
import 'package:water_analytics_australia/core/helper.dart';
import 'package:water_analytics_australia/core/widgets/home_end_drawer.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class AwsAdminUsersPageWrapperProvider extends StatelessWidget {
  const AwsAdminUsersPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AwsAdminUsersCubit>(),
      child: AwsAdminUsersPage(
        client: sl<OdooClient>(),
      ),
    );
  }
}

class AwsAdminUsersPage extends StatefulWidget {
  const AwsAdminUsersPage({required this.client, super.key});

  static const name = 'awsAdminUsers';
  static const path = '/awsAdminUsers';

  final OdooClient client;

  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  static void closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  static void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  State<AwsAdminUsersPage> createState() => _AwsAdminUsersPageState();
}

class _AwsAdminUsersPageState extends State<AwsAdminUsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AwsAdminUsersPage._scaffoldKey,
      endDrawer: const HomeEndDrawer(),
      backgroundColor: const Color(0xfff9fafb),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'Users',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                AwsAdminUsersPage._scaffoldKey.currentState!.openEndDrawer(),
            icon: const HeroIcon(
              HeroIcons.bars3,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () => context.read<AwsAdminUsersCubit>().fetchUsers(),
        child: BlocBuilder<AwsAdminUsersCubit, AwsAdminUsersCubitState>(
          builder: (context, state) {
            if (state is AwsAdminUsersStateLoading) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: ShimmerBox(
                    height: 110,
                  ),
                ),
              );
            } else if (state is AwsAdminUsersStateLoaded) {
              return AwsAdminUsersPageLoaded(
                users: state.users,
              );
            } else if (state is AwsAdminUsersStateError) {
              return AwsAdminUsersPageError(
                onRefresh: () =>
                    context.read<AwsAdminUsersCubit>().fetchUsers(),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class AwsAdminUsersPageLoaded extends StatefulWidget {
  const AwsAdminUsersPageLoaded({
    required this.users,
    super.key,
  });
  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  static void closeDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }

  static void openDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  final List<AwsUser> users;

  @override
  State<AwsAdminUsersPageLoaded> createState() =>
      _AwsAdminUsersPageLoadedState();
}

class _AwsAdminUsersPageLoadedState extends State<AwsAdminUsersPageLoaded> {
  final ctrlSearch = TextEditingController();
  int _rowsPerPage = 50;
  int? id;

  Widget endDrawer({int? id}) {
    final canEdit = id != null;

    return Drawer(
      width: 500,
      child: canEdit
          ? AwsAdminUsersDetailPageWrapperProvider(
              id: id.toString(),
              onUserUpdate: () {
                context.read<AwsAdminUsersCubit>().fetchUsers();
              },
            )
          : CreateUsersPageWrapperProvider(
              onUserCreated: () {
                context.read<AwsAdminUsersCubit>().fetchUsers();
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
    final filteredUsers = ctrlSearch.text.trim().isNotEmpty
        ? widget.users
            .where(
              (e) =>
                  e.displayName
                      .toLowerCase()
                      .contains(ctrlSearch.text.toLowerCase()) ||
                  e.email.toLowerCase().contains(ctrlSearch.text.toLowerCase()),
            )
            .toList()
        : widget.users;

    return Scaffold(
      key: AwsAdminUsersPageLoaded._scaffoldKey,
      endDrawer: endDrawer(id: id),
      backgroundColor: Colors.white,
      body: filteredUsers.isEmpty
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    searchBox(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          id = null;
                        });

                        AwsAdminUsersPageLoaded.openDrawer();
                      },
                      icon: const HeroIcon(
                        HeroIcons.userPlus,
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: Center(
                    child: Text('No users found.'),
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
                    IconButton(
                      onPressed: () {
                        setState(() {
                          id = null;
                        });
                        AwsAdminUsersPageLoaded.openDrawer();
                      },
                      icon: const HeroIcon(
                        HeroIcons.userPlus,
                      ),
                    ),
                  ],
                ),
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
                    columns: const [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Role')),
                      DataColumn(label: Text('Commission %')),
                      DataColumn(label: Text('Actions')),
                    ],
                    source:
                        MyDataTableSource(filteredUsers, context, (int value) {
                      setState(() {
                        id = value;
                      });
                      AwsAdminUsersPageLoaded.openDrawer();
                    }),
                  ),
                ),
              ],
            ),
    );
  }
}

class AwsAdminUsersPageError extends StatelessWidget {
  const AwsAdminUsersPageError({
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
  MyDataTableSource(this.data, this.context, this.insertUserId);
  final List<AwsUser> data;
  final BuildContext context;
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
            insertUserId(item.id);
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
