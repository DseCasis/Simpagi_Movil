import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class LinearCharts extends StatefulWidget {
  const LinearCharts({super.key});

  @override
  _LinearChartsState createState() => _LinearChartsState();
}

class _LinearChartsState extends State<LinearCharts> {
  Future<int> getNumberOfData() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    final database = await openDatabase('notes.db');

    final count =
        await database.query('notes').then((results) => results.length);

    // Cierra la base de datos
    await database.close();

    return count;
  }

  @override
  Widget build(BuildContext context) {
    // ...

    return FutureBuilder<int>(
      future: getNumberOfData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final count = snapshot.data!;

          // Define the series variable with your desired data and formatting
          List<charts.Series<int, int>> series = [
            charts.Series<int, int>(
              id: 'Data Count',
              data: [count], // Use the count retrieved from getNumberOfData()
              domainFn: (v, i) =>
                  10, // Set a fixed domain as you only have one data point
              measureFn: (v, i) => v, // Use the count directly for the measure
              colorFn: (v, i) => charts.ColorUtil.fromDartColor(
                  Colors.blue.shade500), // Set a desired color for the line
            ),
          ];

          // ... Use the defined series variable with charts.LineChart

          return Center(
            child: SizedBox(
              height: 250.0,
              child: charts.LineChart(series),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        // Show a loading indicator while waiting for data
        return CircularProgressIndicator();
      },
    );
  }
}
