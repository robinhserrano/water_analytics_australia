import 'package:flutter/material.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:water_analytics_australia/1_domain/models/sales_record_model.dart';

class CustomDataTable extends StatefulWidget {
  const CustomDataTable({
    required this.data,
    required this.total,
    required this.sortDescending,
    this.sortColumnIndex,
    super.key,
  });
  final List<OrderLine> data;
  final int total;
  final bool sortDescending;
  final int? sortColumnIndex;
  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _headController;
  late ScrollController _bodyController;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _headController = _controllers.addAndGet();
    _bodyController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _headController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SortableTableHead(
          scrollController: _headController,
          sortDescending: widget.sortDescending,
          sortColumnIndex: widget.sortColumnIndex,
        ),
        
        Expanded(
          child: Scrollbar(
            interactive: true,
            controller: _bodyController,
            child: TableBody(
              scrollController: _bodyController,
              data: widget.data,
            ),
          ),
        ),
      ],
    );
  }
}

const double cellWidth = 150;
int maxNumber = 9;

class TableCell extends StatelessWidget {
  const TableCell({
    required this.index,
    required this.value,
    required this.color,
    this.customWidth,
    super.key,
  });
  final int index;
  final String value;
  final Color color;
  final double? customWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: customWidth ?? cellWidth,
      height: cellWidth,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Row(
          children: [
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff6b7585),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTableCell extends StatelessWidget {
  const CustomTableCell({
    required this.color,
    required this.item,
    required this.index,
    this.customWidth,
    super.key,
  });
  final Color color;
  final double? customWidth;
  final OrderLine item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final data = <dynamic>[
      item.productTemplateId?.displayName ?? '',
      item.name,
      item.productUomQty,
      item.qtyDelivered,
      item.qtyInvoiced,
      item.priceUnit,
      item.taxId?[0].displayName ?? '',
      item.discount,
      item.priceSubtotal,
    ];

    final longestString = data.fold('', (prev, element) {
      if (element != null) {
        return element.toString().length > prev.length
            ? element.toString()
            : prev;
      }
      return prev;
    });

    final cellHeight = longestString.length * 2.0;

    return Container(
      constraints: const BoxConstraints(
        minHeight: 72,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      width: customWidth ?? cellWidth,
      height: cellHeight,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        data[index] != null ? data[index].toString() : '',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14, color: Color(0xff6b7585)),
      ),
    );
  }
}

class SortableTableHead extends StatelessWidget {
  const SortableTableHead({
    required this.scrollController,
    required this.sortDescending,
    this.sortColumnIndex,
    super.key,
  });
  final ScrollController scrollController;
  final bool sortDescending;
  final int? sortColumnIndex;

  @override
  Widget build(BuildContext context) {
    final columnLabels = [
      'Description',
      'Quantity',
      'Delivered',
      'Invoiced',
      'Unit Price',
      'Taxes',
      'Disc.%',
      'Tax excl.',
    ];

    return SizedBox(
      height: 72,
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: TableCell(
              index: 0,
              color: Colors.grey.withOpacity(0.2),
              value: 'Product'.toUpperCase(),
            ),
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: List.generate(columnLabels.length, (index) {
                return TableCell(
                  index: index + 1,
                  color: Colors.white,
                  value: columnLabels[index].toUpperCase(),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class TableBody extends StatefulWidget {
  const TableBody({
    required this.scrollController,
    required this.data,
    super.key,
  });

  final ScrollController scrollController;
  final List<OrderLine> data;

  @override
  State<TableBody> createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _firstColumnController;
  late ScrollController _restColumnsController;
  List<OrderLine> data = [];
  int itemLength = 0;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _firstColumnController = _controllers.addAndGet();
    _restColumnsController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _firstColumnController.dispose();
    _restColumnsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120,
          child: ListView(
            controller: _firstColumnController,
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            children: List.generate(widget.data.length, (index) {
              return CustomTableCell(
                color: Colors.grey.withOpacity(0.2),
                item: widget.data[index],
                index: 0,
              );
            }),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: widget.scrollController,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              width: (maxNumber - 1) * cellWidth,
              child: ListView(
                controller: _restColumnsController,
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                children: List.generate(widget.data.length, (y) {
                  return Row(
                    children: List.generate(maxNumber - 1, (x) {
                      return CustomTableCell(
                        item: widget.data[y],
                        color: Colors.white,
                        index: x + 1,
                      );
                    }),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDataTableLoading extends StatelessWidget {
  const CustomDataTableLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final columnLabels = [
      'Store Name',
      'Position',
      'Title',
      'Type',
      'Status',
      'Assigned By',
      'Date Assigned',
      'Start Date',
    ];

    return Column(
      children: [
        SizedBox(
          height: 72,
          child: Row(
            children: [
              SizedBox(
                width: 120,
                child: TableCell(
                  index: 0,
                  color: Colors.grey.withOpacity(0.2),
                  value: 'Name of Assignee'.toUpperCase(),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(columnLabels.length, (index) {
                    return TableCell(
                      index: index + 1,
                      color: Colors.white,
                      value: columnLabels[index].toUpperCase(),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
