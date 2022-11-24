import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'graphController.dart';
import 'model/coordinateModel.dart';

class GraphView extends StatelessWidget {
  const GraphView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.delete<GraphController>();
    final controller = Get.put(GraphController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('GLUCOFIT GRAPH'),
        backgroundColor: Colors.black,
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.all(16),
          children: List.generate(controller.graphList.length, (index) {
            final result = controller.graphList[index];
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SfCartesianChart(
                  title: ChartTitle(
                    text: result.date,
                  ),
                  primaryXAxis: NumericAxis(
                    maximum: 24,
                    minimum: 0
                  ),
                  primaryYAxis: NumericAxis(
                    maximum: 350,
                    minimum: 0
                  ),
                  zoomPanBehavior: ZoomPanBehavior(
                    enableDoubleTapZooming: true,
                    enableMouseWheelZooming: true,
                    enablePanning: true,
                    enablePinching: true,
                    enableSelectionZooming: true
                  ),
                  series: [LineSeries(
                      dataSource: result.coordinateList,
                      xValueMapper: (CoordinateModel coordinate, _) =>
                          coordinate.x,
                      yValueMapper: (CoordinateModel coordinate, _) =>
                          coordinate.y),
                  ]
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
