import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_application/controller/home_controller.dart';

import '../model/five_days_data.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 180,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries<FiveDayData, String>>[
              SplineSeries<FiveDayData, String>(
                dataSource: controller.fiveDaysData,
                xValueMapper: (FiveDayData f, _) => f.dateTime,
                yValueMapper: (FiveDayData f, _) => f.temp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
