import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:water_analytics_australia/1_domain/models/aws_landing_price_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_sales_record_model.dart';
import 'package:water_analytics_australia/1_domain/models/aws_user_model.dart';
import 'package:water_analytics_australia/2_application/pages/aws_sales_report_page/view/sales_report_page.dart';
import 'package:water_analytics_australia/core/hive_helper.dart';

class BarChartStockSold extends StatefulWidget {
  const BarChartStockSold({
    required this.salesOrders,
    required this.landingPrice,
    required this.selectedUsers,
    required this.userAccessLevel,
    super.key,
  });
  final Color leftBarColor = Colors.green; //AppColors.contentColorYellow;
  final Color rightBarColor = Colors.red;
  final Color avgColor = Colors.blue;

  final List<AwsSalesOrder> salesOrders;
  final List<AwsLandingPrice> landingPrice;
  final List<AwsUser> selectedUsers;
  final int userAccessLevel;

  @override
  State<StatefulWidget> createState() => BarChartStockSoldState();
}

class BarChartStockSoldState extends State<BarChartStockSold> {
  final double width = 14;
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;
  late DateTime selectedDate;
  int touchedGroupIndex = -1;
  List<DateTime> dateList = [];
  NumberFormat formatter = NumberFormat('#,##0.00');
  List<StockSold> stockSold = <StockSold>[];

  @override
  void initState() {
    selectedDate = DateTime.now();

    super.initState();
  }

  void _previousMonth() {
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month + 1);
    });
  }

  void updateStocks() {
    final currentStockSold = <StockSold>[];

    for (final landingPrice in widget.landingPrice) {
      currentStockSold.add(
        StockSold(
          name: landingPrice.name ?? '',
          internalReference: landingPrice.internalReference ?? '',
          qtySold: 0,
        ),
      );
    }

    final salesOrderViaMonth = widget.salesOrders.where((sales) {
      final orderDate = sales.createDate;
      return orderDate != null &&
          orderDate.month == selectedDate.month &&
          orderDate.year == selectedDate.year;
    }).toList();

    for (final stock in currentStockSold) {
      for (final sales in salesOrderViaMonth) {
        if (sales.orderLine != null) {
          for (final orderLine in sales.orderLine!) {
            if ((orderLine.product ?? '')
                .toLowerCase()
                .contains(stock.internalReference.toLowerCase())) {
              stock.qtySold += (orderLine.quantity ?? 1).toDouble();
            }
          }
        }
      }
    }

    final items = List<BarChartGroupData>.generate(
      currentStockSold.length,
      (index) => makeGroupData(
        index,
        currentStockSold[index].qtySold,
        index.toDouble(),
      ),
    );

    setState(() {
      stockSold = currentStockSold;
      rawBarGroups = items;
      showingBarGroups = rawBarGroups;
    });
  }

  @override
  Widget build(BuildContext context) {
    updateStocks();

    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (!DateTime(selectedDate.year, selectedDate.month)
                        .isBefore(
                      AwsSalesOrder.getEarliestCreatedDate(
                        widget.salesOrders,
                      ).createDate!,
                    )) ...[
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: _previousMonth,
                      ),
                    ],
                    Text(
                      'Stocks Sold in '
                      '${DateFormat('MMM yyyy').format(selectedDate)}',
                      style: const TextStyle(
                        color: Color(0xff77839a),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (!DateTime(selectedDate.year, selectedDate.month + 1)
                        .isAfter(DateTime.now())) ...[
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: _nextMonth,
                      ),
                    ],
                  ],
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
                ] else if (widget.selectedUsers.isEmpty &&
                    widget.userAccessLevel < 4 &&
                    widget.userAccessLevel > 1) ...[
                  const Text(
                    'of the Team',
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
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        final value = rod.toY;
                        return BarTooltipItem(
                          'Qty: ${formatter.format(value)}'
                          '\n${stockSold[groupIndex].name}',
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
        stockSold[value.toInt()].internalReference,
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
}

LinearGradient get _barsGradient => LinearGradient(
      colors: [
        Colors.cyan.shade700,
        Colors.cyan.shade700,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
