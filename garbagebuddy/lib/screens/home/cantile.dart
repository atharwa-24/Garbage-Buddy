import 'package:flutter/material.dart';
import 'package:garbagebuddy/models/can.dart';
import 'package:garbagebuddy/charts/can_chart.dart';
import 'package:garbagebuddy/charts/chart_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CanTile extends StatelessWidget {

  final Can can;
  CanTile({this.can});

  @override
  Widget build(BuildContext context) {

    final List<CanData> data1 = [
      CanData(
          week: 'Week-1',
          co2Level: 600,
          barColor:charts.ColorUtil.fromDartColor(Colors.lightGreen)
      ),
      CanData(
          week: 'Week-2',
          co2Level: 420,
          barColor:charts.ColorUtil.fromDartColor(Colors.lightGreen)
      ),
      CanData(
          week: 'This week',
          co2Level: can.co2Level,
          barColor:charts.ColorUtil.fromDartColor(Colors.lightGreen)
      ),
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
                backgroundImage: AssetImage('assets/trash.png'),
                radius: 30.0
            ),
          ),
          Divider(
              height: 40.0,
              color: Colors.green[900]
          ),
          Text(
            'CO2 Levels: ',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            can.co2,
            style: TextStyle(
                color: Colors.green[700],
                letterSpacing: 2.0,
                fontSize: 23.0,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Can space: ',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            can.space,
            style: TextStyle(
                color: Colors.green[700],
                letterSpacing: 2.0,
                fontSize: 23.0,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Space available: ',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            can.availableSpace.toString(),
            style: TextStyle(
                color: Colors.green[700],
                letterSpacing: 2.0,
                fontSize: 23.0,
                fontWeight: FontWeight.bold
            ),
          ),
          CanChart(
            data: data1,
          )
        ],
      ),
    );
  }
}
