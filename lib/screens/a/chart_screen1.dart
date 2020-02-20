import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartScreen1 extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  ChartScreen1(this.seriesList, {this.animate});

  factory ChartScreen1.withSampleData() {
    return ChartScreen1(
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
            '차트화면1',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: charts.PieChart(
            seriesList,
            animate: animate,
            defaultRenderer: new charts.ArcRendererConfig(
                arcWidth: 60,
                arcRendererDecorators: [new charts.ArcLabelDecorator()]),
          ),
        ),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 100),
      LinearSales(1, 75),
      LinearSales(2, 25),
      LinearSales(3, 5),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
