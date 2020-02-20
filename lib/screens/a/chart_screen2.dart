import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartScreen2 extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  ChartScreen2(this.seriesList, {this.animate});

  factory ChartScreen2.withSampleData() {
    return ChartScreen2(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            '차트화면2',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          height: 500.0,
          child: charts.LineChart(seriesList,
              animate: animate,
              defaultRenderer: charts.LineRendererConfig(includePoints: true)),
        ),
      ),
    );
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 5),
      LinearSales(1, 25),
      LinearSales(2, 100),
      LinearSales(3, 75),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
