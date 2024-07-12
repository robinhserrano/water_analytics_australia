import 'package:data_table_2/data_table_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    final Dio dio = Dio(); // Initialize Dio

    final dataSource = ItemDataSource(dio);

    return Scaffold(
      body: Column(
        children: [
          PaginatedDataTable2(
            columns: [
              DataColumn(label: Text('Number')),
              DataColumn(label: Text('Order Date')),
              DataColumn(label: Text('Customer')),
              DataColumn(label: Text('Sales Rep')),
              DataColumn(label: Text('Sales Source')),
              DataColumn(label: Text('Commission Paid')),
              DataColumn(label: Text('Total')),
              DataColumn(label: Text('Delivery Status')),
              DataColumn(label: Text('EST Install Date')),
              DataColumn(label: Text('Final Commission')),
              DataColumn(label: Text('Confirmed by Manager')),
            ],
            source: dataSource,
            
          )
        ],
      ),
    );
  }
}

class ItemDataSource extends AsyncDataTableSource {

  ItemDataSource(this.dio);
  final Dio dio;
  int _totalRows = 0;

  @override
  Future<AsyncRowsResponse> getRows(int startIndex, int count) async {
    final response =
        await dio.get('https://api.example.com/items', queryParameters: {
      'start': startIndex,
      'count': count,
    });

    final data = response.data['data'] as List;
    _totalRows = response.data['total'] as int;

    List<DataRow> rows = data.map<DataRow>((item) {
      return DataRow(
        key: ValueKey(item['id']),
        cells: [
          DataCell(Text(item['id'].toString())),
          DataCell(Text(item['name'].toString())),
        ],
      );
    }).toList();

    return AsyncRowsResponse(_totalRows, rows);
  }

  @override
  int get rowCount => _totalRows;
}
