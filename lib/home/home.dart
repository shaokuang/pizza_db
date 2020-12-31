import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:pizza_db/models/pizza_model.dart';

//create List expecting PizzaModel class called pizzas
//some comments
List<PizzaModel> pizzas = List<PizzaModel>();

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
  //bool sort; not needed i think?
  int _sortColumnIndex;
  bool _sortAscending = true;

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
                  child: Text('Loading...'),
                ),
              );
            } else {
              return PaginatedDataTable(
                header: Text('HEADER'),
                source: _pizzaDataSource,
                sortAscending: _sortAscending,
                sortColumnIndex: _sortColumnIndex,
                columns: <DataColumn>[
                  DataColumn(
                    label: Text('ID'),
                    numeric: true,
                    onSort: (int columnIndex, bool ascending) {
                      _pizzaDataSource._sort((pizza) => pizza.id, ascending);

                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                      });
                    }),
                  DataColumn(
                    label: Text('Name'),
                    onSort: (int columnIndex, bool ascending) {
                      _pizzaDataSource._sort((pizza) => pizza.name, ascending);

                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                      });
                    }),
                  DataColumn(
                    label: Text('Rating'),
                    numeric: true,
                    onSort: (int columnIndex, bool ascending) {
                      _pizzaDataSource._sort((pizza) => pizza.rating, ascending);

                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                      });
                    }),
                  DataColumn(
                    label: Text('Pricing'),
                    numeric: true,
                    onSort: (int columnIndex, bool ascending) {
                      _pizzaDataSource._sort((pizza) => pizza.pricing, ascending);

                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                      });
                    }),
                  DataColumn(label: Text('Brand')),
                  DataColumn(
                    label: Text('Time to Cook'),
                    numeric: true,
                    onSort: (int columnIndex, bool ascending) {
                      _pizzaDataSource._sort((pizza) => pizza.timeToCook, ascending);

                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                      });
                    }),
                  DataColumn(label: Text('Review Date'),
                  onSort: (int columnIndex, bool ascending) {
                      _pizzaDataSource._sort((pizza) => pizza.reviewDate, ascending);

                      setState(() {
                        _sortColumnIndex = columnIndex;
                        _sortAscending = ascending;
                      });
                    }),
                  DataColumn(label: Text('Notes')),
                  DataColumn(label: Text('Tags')),
                  DataColumn(label: Text('Picture')),
                ],
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
      DataCell(Text(pizza.notes)),
      DataCell(Text(pizza.tags)),
      DataCell(Text(pizza.picture)),
    ]);
  }

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
