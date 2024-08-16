import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:water_analytics_australia/1_domain/models/aws_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_report_page/bloc/sales_report_cubit.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_report_page/view/bar_chart_stock_sold.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_report_page/view/bar_chart_total_sales.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';
import 'package:water_analytics_australia/core/widgets/shimmer_box.dart';
import 'package:water_analytics_australia/injection.dart';

class StockSold {
  StockSold({
    required this.name,
    required this.internalReference,
    required this.qtySold,
  });
  String name;
  String internalReference;
  double qtySold;
}

class SalesReportPageWrapperProvider extends StatelessWidget {
  const SalesReportPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SalesReportCubit>(),
      child: SalesReportPage(),
    );
  }
}

class SalesReportPage extends StatefulWidget {
  SalesReportPage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<SalesReportPage> createState() => _SalesReportPageState();
}

class _SalesReportPageState extends State<SalesReportPage> {
  List<String> selectedCompletedDate = [];
  DateTime? startDate;
  DateTime? endDate;
  String? henlo;
  DateTimeRange selectedDateRange = DateTimeRange(
    start: DateTime.now()
        .subtract(const Duration(days: 180)), // Default to last 6 months
    end: DateTime.now(),
  );
  int userAccessLevel = 1;

  // String selectedReps = '';

  @override
  void initState() {
    _getUserFromHive();
    super.initState();
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  Future<void> _getUserFromHive() async {
    final user = await HiveHelper.getCurrentUser();
    userAccessLevel = user?.accessLevel ?? 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'Sales Report',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: RefreshIndicator(
        color: const Color(0xff0083ff),
        onRefresh: () => context.read<SalesReportCubit>().fetchSales(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: BlocBuilder<SalesReportCubit, SalesReportCubitState>(
            buildWhen: (previous, current) {
              final a = previous;
              final b = current;
              return true;
            },
            builder: (context, state) {
              if (state is SalesReportStateLoading) {
                return ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: ShimmerBox(
                      height: 110,
                    ),
                  ),
                );
              } else if (state is SalesReportStateLoaded) {
                final salesOrders = state.records;
                final landingPrices = state.landingPrice;
                final usersAboveLevel2 = state.usersAboveLevel2;

                return SalesListPageLoaded(
                  salesOrders: salesOrders,
                  landingPrices: landingPrices,
                  usersAboveLevel2: usersAboveLevel2,
                  userAccessLevel: userAccessLevel,
                );
              } else if (state is SalesReportStateError) {
                return SalesListPageError(
                  onRefresh: () =>
                      context.read<SalesReportCubit>().fetchSales(),
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

class CustomDateTile extends StatelessWidget {
  const CustomDateTile({
    required this.data,
    required this.title,
    this.onTap,
    super.key,
  });
  final List<String> data;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
          child: Text(
            title,
            style: const TextStyle(color: Color(0xff6b7685)),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            margin: const EdgeInsets.only(
              left: 12,
              right: 12,
              bottom: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12,
              ),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Row(
              children: [
                if (data.isEmpty) ...[
                  const HeroIcon(HeroIcons.calendarDays),
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Start Date',
                          style: TextStyle(
                            color: Color(0xff6b7585),
                          ),
                        ),
                        Text('To'),
                        Text(
                          'End Date',
                          style: TextStyle(
                            color: Color(0xff6b7585),
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  const HeroIcon(HeroIcons.calendarDays),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          formatDate(data[0]),
                          style: const TextStyle(
                            color: Color(0xff6b7585),
                          ),
                        ),
                        const Text('To'),
                        Text(
                          formatDate(data[1]),
                          style: const TextStyle(
                            color: Color(0xff6b7585),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

String formatDate(String inputDate) {
  final dateTime = DateFormat('MM/dd/yyyy').parse(inputDate);
  final formattedDate = DateFormat('MMM d, yyyy').format(dateTime);

  return formattedDate;
}

class SalesListPageLoaded extends StatefulWidget {
  const SalesListPageLoaded({
    required this.salesOrders,
    required this.landingPrices,
    required this.usersAboveLevel2,
    required this.userAccessLevel,
    super.key,
  });

  final List<AwsSalesOrder> salesOrders;
  final List<AwsLandingPrice> landingPrices;
  final List<AwsUser> usersAboveLevel2;
  final int userAccessLevel;
  @override
  State<SalesListPageLoaded> createState() => _SalesListPageLoadedState();
}

class _SalesListPageLoadedState extends State<SalesListPageLoaded> {
  String selectedReps = '';
  List<int> selectedUserIds = [];
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    final salesOrders = widget.salesOrders;
    final landingPrices = widget.landingPrices;
    final usersAboveLevel2 = widget.usersAboveLevel2;

    var users = <AwsUser>[];
    var allUsers = <AwsUser>[];

    final stockSold = <StockSold>[];

    for (final landingPrice in landingPrices) {
      stockSold.add(
        StockSold(
          name: landingPrice.name ?? '',
          internalReference: landingPrice.internalReference ?? '',
          qtySold: 0, // qtySold is no longer final
        ),
      );
    }

    for (final stock in stockSold) {
      for (final sales in salesOrders) {
        if (sales.orderLine != null) {
          for (final orderLine in sales.orderLine!) {
            if ((orderLine.product ?? '')
                .toLowerCase()
                .contains(stock.internalReference.toLowerCase())) {
              stock.qtySold += (orderLine.quantity ?? 1).toDouble();
            }
          }
        }

        if (sales.user != null) {
          users.add(sales.user!);
        }
      }
    }

    users = users.toSet().toList();
    allUsers = [...users, ...usersAboveLevel2];

    final filteredTeams = <List<AwsUser>>[];
    for (final manager in usersAboveLevel2) {
      final salesManager = users //lvl4
          .where(
            (e) => e.salesManagerId == manager.id && e.accessLevel == 3,
          )
          .toList();

      final salesTeamManager = users //lvl3
          .where(
            (e) => e.salesManagerId == manager.id && e.accessLevel == 2,
          )
          .toList();

      final managersIds = [
        manager.id,
        ...salesManager.map((e) => e.id),
        ...salesTeamManager.map((e) => e.id),
        //  (user?.userId ?? 0),
      ];

      final salesPerson = users //lvl2 or lvl1
          .where(
            (e) => managersIds.contains(e.salesManagerId),
          )
          .toList();

      final temp = {
        manager,
        ...salesManager,
        ...salesTeamManager,
        ...salesPerson,
      }.toList();

      if (temp.length > 1) {
        filteredTeams.add(temp);
      }
    }

    var selectedOrders = selectedUserIds.isNotEmpty
        ? salesOrders
            .where((e) => selectedUserIds.contains(e.user?.id))
            .toList()
        : salesOrders;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ExpandableCheckboxList(
          filteredTeams: filteredTeams,
          selectedUserIds: selectedUserIds,
          updateSelectedUserIds: (List<int> ids) {
            setState(() {
              selectedUserIds = ids;
            });
            _scaffoldKey.currentState!.closeDrawer();
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                  child: const Row(
                    children: [
                      HeroIcon(HeroIcons.funnel),
                      Text('Filter by Users'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (selectedOrders.isNotEmpty) ...[
            SizedBox(
              height: 600,
              child: BarChartTotalSales(
                orders: selectedOrders,
                selectedUsers: allUsers
                    .where((e) => selectedUserIds.contains(e.id))
                    .toSet()
                    .toList(),
                userAccessLevel: widget.userAccessLevel,
              ),
            ),
            const Divider(),
            SizedBox(
              height: 600,
              child: BarChartStockSold(
                salesOrders: selectedOrders,
                landingPrice: landingPrices,
                selectedUsers: allUsers
                    .where((e) => selectedUserIds.contains(e.id))
                    .toSet()
                    .toList(),
                userAccessLevel: widget.userAccessLevel,
              ),
            ),
          ] else ...[
            const SizedBox(
              height: 500,
              child: Center(
                child: Text("The user's sales order history is empty."),
              ),
            ),
          ],
        ],
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

Map<DateTime, double> getTotalSalesPerMonth(List<AwsSalesOrder> orders) {
  final Map<DateTime, double> monthlySales = {};

  for (var order in orders) {
    if (order.createDate != null && order.amountTotal != null) {
      final date = order.createDate!;
      final startOfMonth =
          DateTime(date.year, date.month); // Start of the month

      if (!monthlySales.containsKey(startOfMonth)) {
        monthlySales[startOfMonth] = 0.0;
      }
      monthlySales[startOfMonth] =
          monthlySales[startOfMonth]! + order.amountTotal!;
    }
  }

  return monthlySales;
}

Map<DateTime, double> getTotalSalesPerDay(List<AwsSalesOrder> orders) {
  final Map<DateTime, double> dailySales = {};

  for (var order in orders) {
    if (order.createDate != null && order.amountTotal != null) {
      final date = order.createDate!;
      final startOfDay =
          DateTime(date.year, date.month, date.day); // Start of the day

      if (!dailySales.containsKey(startOfDay)) {
        dailySales[startOfDay] = 0.0;
      }
      dailySales[startOfDay] = dailySales[startOfDay]! + order.amountTotal!;
    }
  }

  return dailySales;
}

FlTitlesData _buildTitlesData() {
  return FlTitlesData(
    leftTitles: const AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: true, interval: 50000),
    ),
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 40,
        getTitlesWidget: (value, meta) {
          return SideTitleWidget(
            axisSide: meta.axisSide,
            child: Text(
              _getPeriodLabel(value.toInt()),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    ),
  );
}

String _getPeriodLabel(int period) {
  final year = period ~/ 12;
  final month = period % 12;

  if (month == 0) {
    return '$year';
  }
  return period
      .toString(); //'${DateFormat('MMM yyyy').format(DateTime(year, month))}';
}

List<BarChartGroupData> _getBarGroups(
  List<AwsSalesOrder> salesOrder,
  DateTimeRange selectedDateRange,
) {
  final groupedData = _groupOrdersByPeriod(
    salesOrder,
    selectedDateRange,
  );
  return groupedData.entries.map((entry) {
    return BarChartGroupData(
      x: entry.key,
      barRods: [
        BarChartRodData(
          toY: entry.value,
          color: Colors.blue,
          width: 16,
        ),
      ],
    );
  }).toList();
}

Map<int, double> _groupOrdersByPeriod(
  List<AwsSalesOrder> salesOrder,
  DateTimeRange selectedDateRange,
) {
  final Map<int, double> salesData = {};

  for (var order in salesOrder) {
    if (order.createDate != null && order.amountTotal != null) {
      final date = order.createDate!;
      if (date.isAfter(selectedDateRange.start) &&
          date.isBefore(selectedDateRange.end)) {
        final period = _getPeriodKey(date); // e.g., month or day

        salesData[period] = (salesData[period] ?? 0) + order.amountTotal!;
      }
    }
  }

  return salesData;
}

int _getPeriodKey(DateTime date) {
  // Returns an integer representing the period for grouping
  // Example for monthly grouping: (date.year * 12) + date.month
  return (date.year * 12) + date.month; // Group by month
}

class UserDropdown extends StatefulWidget {
  final List<AwsUser> users;

  const UserDropdown({Key? key, required this.users}) : super(key: key);

  @override
  _UserDropdownState createState() => _UserDropdownState();
}

class _UserDropdownState extends State<UserDropdown> {
  List<bool> selectedUsers = [];

  @override
  void initState() {
    super.initState();
    selectedUsers = List.generate(widget.users.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<List<AwsUser>>(
      items: [
        DropdownMenuItem(
          value: widget.users,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.users.length, (index) {
              final user = widget.users[index];
              return CheckboxListTile(
                title: Text(user.displayName),
                value: selectedUsers[index],
                onChanged: (value) {
                  setState(() {
                    selectedUsers[index] = value!;
                  });
                },
              );
            }),
          ),
        ),
      ],
      onChanged: (value) {
        // Handle selected users here
      },
    );
  }
}

class ExpandableCheckboxList extends StatefulWidget {
  final List<List<AwsUser>> filteredTeams;
  final List<int> selectedUserIds;
  final void Function(List<int> selectedUserIds) updateSelectedUserIds;

  const ExpandableCheckboxList({
    required this.filteredTeams,
    required this.selectedUserIds,
    required this.updateSelectedUserIds,
    Key? key,
  }) : super(key: key);

  @override
  _ExpandableCheckboxListState createState() => _ExpandableCheckboxListState();
}

class _ExpandableCheckboxListState extends State<ExpandableCheckboxList> {
  // This will store the checked status for each AwsUser
  final Map<int, bool> _checkedStatus = {};

  @override
  void initState() {
    for (final user in widget.selectedUserIds) {
      // setState(() {
      _checkedStatus[user] = true; // ?? false;
      // });
    }

    super.initState();
  }

  String getSelectedUsersInTeamLength(List<AwsUser> team) {
    var len = 0;
    for (final user in team) {
      if (_checkedStatus.keys.toList().contains(user.id)) {
        try {
          if (_checkedStatus[user.id] != false) {
            len += 1;
          }
        } catch (e) {
          len = len;
        }
      }
    }

    return len > 0 ? '($len)' : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: ColoredBox(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  bottom: 8,
                  top: 8,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    widget.updateSelectedUserIds([]);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xffFFFFFF),
                    side: const BorderSide(
                      color: Color(0xffD0D5DD),
                    ),
                  ),
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      color: Color(0xff344054),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  bottom: 8,
                  top: 8,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    final selectedUserIds = <int>[];
                    _checkedStatus.forEach((key, value) {
                      if (value) {
                        selectedUserIds.add(key);
                      }
                    });

                    widget.updateSelectedUserIds(selectedUserIds);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xff475467),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeroIcon(HeroIcons.funnel),
                Text(
                  'Filter By Users',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          ...widget.filteredTeams.asMap().entries.map((entry) {
            final teamIndex = entry.key;
            final team = entry.value;

            final teamName = team
                .reduce((a, b) => a.accessLevel >= b.accessLevel ? a : b)
                .displayName;

            return ExpansionTile(
              title: Row(
                children: [
                  Text(
                    "${teamName.toLowerCase().endsWith('s') ? teamName : "${teamName}'s"} Team",
                  ),
                  Text(
                    ' ${getSelectedUsersInTeamLength(team)}',
                    style: const TextStyle(color: Colors.teal),
                  ),
                ],
              ),
              children: team.map((user) {
                return CheckboxListTile(
                  title: Text(user.displayName),
                  value: _checkedStatus[user.id] ?? false,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkedStatus[user.id] = value ?? false;
                    });
                  },
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
