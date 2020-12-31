import 'package:flutter/material.dart';
import 'home.dart';



class MyDataTable extends StatefulWidget {
  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {

  final PizzaDataSource _pizzaDataSource = PizzaDataSource();

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      header: Text('HEADER'),
      source: _pizzaDataSource,
      columns: const <DataColumn>[
        DataColumn(
          label: Text('ID')
        ),
        DataColumn(
          label: Text('Name')
        )
      ],


      
    );
  }
}