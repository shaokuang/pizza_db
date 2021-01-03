import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:pizza_db/models/pizza_model.dart';

//create List expecting PizzaModel class called pizzas
List<PizzaModel> pizzas = List<PizzaModel>();

//used for dialog boxes
BuildContext globalContext;

//get data from google sheet, decode json, convert to PizzaModel class, add results to pizzas
Future<List<PizzaModel>> getPizzaFromSheet() async {
  //specify url to get data from
  var url =
      "https://script.google.com/macros/s/AKfycbyZixrzRjubvXFbtySZHEDK9KHjTH8AnAyy3HRsgYDY3UyliNQ/exec";

  //get the data  from URL
  var raw = await http.get(url);

  //decode the raw data into JSON
  var jsonPizza = convert.jsonDecode(raw.body);
  print('first print$jsonPizza');

  //convert JSON key value pairs to flutter pizza model for each row
  jsonPizza.forEach((element) {
    PizzaModel pizzaModel = PizzaModel();
    pizzaModel.id = element['id'];
    pizzaModel.name = element['name'];
    pizzaModel.rating = element['rating'];
    pizzaModel.pricing = element['pricing'];
    pizzaModel.brand = element['brand'];
    pizzaModel.notes = element['notes'];
    pizzaModel.timeToCook = element['time_to_cook'];
    pizzaModel.reviewDate = element['review_date'];
    pizzaModel.tags = element['tags'];
    pizzaModel.picture = element['picture'];

    //add each attribute into a list of PizzaModels called pizzas
    pizzas.add(pizzaModel);
  });

  return pizzas;
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //create a new PizzaModel List, we will store the results for getting data function here
  Future<List<PizzaModel>> futurePizza;

  @override
  void initState() {
    super.initState();
    futurePizza = getPizzaFromSheet();
  }

  //establish pizza data source
  PizzaDataSource _pizzaDataSource = PizzaDataSource();

  //used for sorting data
  int _sortColumnIndex;
  bool _sortAscending = true;

  //used for rows per page config
  int _rowsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: Text('Pizza DB'),
        ),
        body: FutureBuilder(
          future: futurePizza,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              globalContext = context;
              return SingleChildScrollView(
                child: PaginatedDataTable(
                  header: Text('Pizzas'),
                  availableRowsPerPage: [10, 20, 30, 50],
                  rowsPerPage: _rowsPerPage,
                  onRowsPerPageChanged: (int newRowsPerPage) {
                    setState(() {
                      _rowsPerPage = newRowsPerPage;
                    });
                  },
                  source: _pizzaDataSource,
                  sortAscending: _sortAscending,
                  sortColumnIndex: _sortColumnIndex,
                  columns: <DataColumn>[
                    DataColumn(
                        label: Text('ID'),
                        numeric: true,
                        onSort: (int columnIndex, bool ascending) {
                          _pizzaDataSource._sort(
                              (pizza) => pizza.id, ascending);

                          setState(() {
                            _sortColumnIndex = columnIndex;
                            _sortAscending = ascending;
                          });
                        }),
                    DataColumn(
                        label: Text('Name'),
                        onSort: (int columnIndex, bool ascending) {
                          _pizzaDataSource._sort(
                              (pizza) => pizza.name, ascending);

                          setState(() {
                            _sortColumnIndex = columnIndex;
                            _sortAscending = ascending;
                          });
                        }),
                    DataColumn(
                        label: Text('Rating'),
                        numeric: true,
                        onSort: (int columnIndex, bool ascending) {
                          _pizzaDataSource._sort(
                              (pizza) => pizza.rating, ascending);

                          setState(() {
                            _sortColumnIndex = columnIndex;
                            _sortAscending = ascending;
                          });
                        }),
                    DataColumn(
                        label: Text('Pricing'),
                        numeric: true,
                        onSort: (int columnIndex, bool ascending) {
                          _pizzaDataSource._sort(
                              (pizza) => pizza.pricing, ascending);

                          setState(() {
                            _sortColumnIndex = columnIndex;
                            _sortAscending = ascending;
                          });
                        }),
                    DataColumn(
                        label: Text('Brand'),
                        onSort: (int columnIndex, bool ascending) {
                          _pizzaDataSource._sort(
                              (pizza) => pizza.brand, ascending);

                          setState(() {
                            _sortColumnIndex = columnIndex;
                            _sortAscending = ascending;
                          });
                        }),
                    DataColumn(
                        label: Text('Time to Cook'),
                        numeric: true,
                        onSort: (int columnIndex, bool ascending) {
                          _pizzaDataSource._sort(
                              (pizza) => pizza.timeToCook, ascending);

                          setState(() {
                            _sortColumnIndex = columnIndex;
                            _sortAscending = ascending;
                          });
                        }),
                    DataColumn(
                        label: Text('Review Date'),
                        onSort: (int columnIndex, bool ascending) {
                          _pizzaDataSource._sort(
                              (pizza) => pizza.reviewDate, ascending);

                          setState(() {
                            _sortColumnIndex = columnIndex;
                            _sortAscending = ascending;
                          });
                        }),
                    DataColumn(label: Text('Notes')),
                    DataColumn(label: Text('Tags')),
                    DataColumn(label: Text('Picture')),
                  ],
                ),
              );
            }
          },
        ));
  }
}

//details of pizza data source
class PizzaDataSource extends DataTableSource {
  int selectedCount = 0;

  @override
  int get rowCount => pizzas.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => selectedCount;

  @override
  DataRow getRow(int index) {
    PizzaModel pizza = pizzas[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text(pizza.id.toString())),
      DataCell(Text(pizza.name)),
      DataCell(Text(pizza.rating.toString())),
      DataCell(Text(pizza.pricing.toString())),
      DataCell(Text(pizza.brand)),
      DataCell(Text(pizza.timeToCook.toString())),
      DataCell(Text(pizza.reviewDate)),
      DataCell(IconButton(
        icon: Icon(Icons.info_outline),
        onPressed: () async {
          await showDialog(
              barrierDismissible: true,
              context: globalContext,
              builder: (BuildContext context) => new AlertDialog(
                    title: Text('Notes'),
                    content: Text(pizza.notes),
                    contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 23.0, 20.0),
                    actions: [
                      FlatButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                    ],
                  ));
        },
      )),
      DataCell(Text(pizza.tags)),
      DataCell(IconButton(
        icon: Icon(Icons.photo_library),
        onPressed: () async {
          await showDialog(
              barrierDismissible: true,
              context: globalContext,
              builder: (BuildContext context) => new AlertDialog(
                    title: Text('Picture(s)'),
                    content:
                        Image.network(
                          pizza.picture,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;

                            return (LinearProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) => 
                            Text('No pictures available'),
                          ),
                    contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 23.0, 20.0),
                    actions: [
                      FlatButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          })
                    ],
                  ));
        },
      )),
    ]);
  }

  //custom sorting function to sort items in pizza
  void _sort(getField(pizza), bool ascending) {
    pizzas.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }

      final aValue = getField(a);
      final bValue = getField(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }
}
