import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'graphController.dart';

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
                // SfCartesianChart(
                //   title: ChartTitle(text: '${result['date']}',),
                //   primaryXAxis: DateTimeAxis(),
                //   series: LineSeries(dataSource: dataSource, xValueMapper: xValueMapper, yValueMapper: yValueMapper),
                // ),
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
