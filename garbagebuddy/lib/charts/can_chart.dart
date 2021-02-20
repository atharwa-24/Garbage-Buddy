import 'package:flutter/material.dart';
import 'package:garbagebuddy/charts/chart_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CanChart extends StatelessWidget {

  final List<CanData> data;
  CanChart({this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<CanData, String>> series = [
      charts.Series(
        id: 'Can',
        data: data,
        domainFn: (CanData series, _) => series.week,
        measureFn: (CanData series, _) => series.co2Level,
        colorFn: (CanData series, _) => series.barColor,
      )
    ];
    return Container(
      height: 300,
      padding: EdgeInsets.all(20.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('CO2 Levels'),
              Expanded(child: charts.BarChart(series))
            ],
          ),
        ),
      ),
    );
  }
}
