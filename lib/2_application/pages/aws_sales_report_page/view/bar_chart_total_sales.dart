import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';

class BarChartTotalSales extends StatefulWidget {
  const BarChartTotalSales({
    required this.orders,
    required this.selectedUsers,
    required this.userAccessLevel,
    super.key,
  });
  final Color leftBarColor = Colors.green; //AppColors.contentColorYellow;
  final Color rightBarColor = Colors.red;
  final Color avgColor = Colors.blue;

  final List<AwsSalesOrder> orders;
  final List<AwsUser> selectedUsers;
  final int userAccessLevel;
  @override
  State<StatefulWidget> createState() => BarChartTotalSalesState();
}

class BarChartTotalSalesState extends State<BarChartTotalSales> {
  final double width = 14;
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;
  int touchedGroupIndex = -1;
  List<DateTime> dateList = [];
  NumberFormat formatter = NumberFormat('#,##0.00');

  @override
  void initState() {
    super.initState();
    updateChartData();
  }

  void updateChartData() {
    final salesPerMonth2 = getTotalSalesPerMonth2(widget.orders);
    // final salesPerDay2 = getTotalSalesPerDay2(widget.orders);

    final items = List<BarChartGroupData>.generate(
      salesPerMonth2.length,
      (index) => makeGroupData(
        index,
        salesPerMonth2.values.elementAt(index),
        index.toDouble(),
      ),
    );

    setState(() {
      rawBarGroups = items;
      showingBarGroups = rawBarGroups;
      dateList = salesPerMonth2.keys.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    updateChartData();
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Total Sales By Month',
                  style: TextStyle(
                    color: Color(0xff77839a),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (widget.selectedUsers.isEmpty &&
                    widget.userAccessLevel > 3) ...[
                  const Text(
                    'of Water Analytics Australia',
                    style: TextStyle(
                      color: Color(0xff77839a),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ] else if (widget.selectedUsers.isNotEmpty) ...[
                  if (widget.selectedUsers.length > 1) ...[
                    Tooltip(
                      message: widget.selectedUsers
                          .map((e) => e.displayName)
                          .toList()
                          .join('\n'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'of ${widget.selectedUsers.length} Users ',
                            style: const TextStyle(
                              color: Color(0xff77839a),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const HeroIcon(
                            HeroIcons.userGroup,
                            color: Color(0xff77839a),
                          ),
                        ],
                      ),
                    ),
                  ] else if (widget.selectedUsers.length == 1) ...[
                    Text(
                      'of ${widget.selectedUsers.first.displayName}',
                      style: const TextStyle(
                        color: Color(0xff77839a),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ],
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: rawBarGroups.isNotEmpty
                      ? rawBarGroups
                              .expand((group) => group.barRods)
                              .map((rod) => rod.toY)
                              .reduce((a, b) => a > b ? a : b) *
                          1.1
                      : 100000,
                  barTouchData: BarTouchData(
                    // touchTooltipData: BarTouchTooltipData(
                    //   getTooltipColor: (group) => Colors.grey,
                    //   getTooltipItem: (a, b, c, d) => null,
                    // ),
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        // Access data from the group and rod to construct the tooltip text
                        final value = rod.toY;
                        return BarTooltipItem(
                          '\$ ${formatter.format(value)}',
                          const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod
                              in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg = sum /
                              showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                            barRods: showingBarGroups[touchedGroupIndex]
                                .barRods
                                .map((rod) {
                              return rod.copyWith(
                                toY: avg,
                                color: widget.avgColor,
                              );
                            }).toList(),
                          );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(),
                    topTitles: const AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      fontSize: 10,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
        style: style,
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final Widget text = Transform.rotate(
      angle: -(3.14 / 4),
      child: Text(
        DateFormat('MMM yy').format(dateList[value.toInt()]),
        style: const TextStyle(
          color: Color(0xff7589a2),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, // margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
          gradient: _barsGradient,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(width: space),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(width: space),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(width: space),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(width: space),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}

Map<DateTime, double> getTotalSalesPerMonth2(List<AwsSalesOrder> orders) {
  final monthlySales = <DateTime, double>{};

  for (final order in orders) {
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

  final sortedSales = monthlySales.entries.toList()
    ..sort((a, b) => a.key.compareTo(b.key));

  // Convert List of MapEntries back to Map
  return Map.fromEntries(sortedSales);
}

Map<DateTime, double> getTotalSalesPerDay2(List<AwsSalesOrder> orders) {
  final dailySales = <DateTime, double>{};

  for (final order in orders) {
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

LinearGradient get _barsGradient => LinearGradient(
      colors: [
        Colors.cyan.shade700,
        Colors.cyan.shade700,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
