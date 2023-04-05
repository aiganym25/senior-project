import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ViewResult extends StatelessWidget {
  ViewResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(248, 180, 1, 1),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(248, 180, 1, 1),
        title: const Text(
          "Result",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 64,
          ),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              // decoration: const BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.all(Radius.circular(15)),
              // ),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(4.0, 4.0),
                      blurRadius: 4.0,
                      spreadRadius: 3),
                ],
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, 0.25),
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(225, 225, 225, 1),
                    Color.fromRGBO(255, 207, 81, 1),
                  ],
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    height: 150.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'Number of words: 10',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Word show time: 1.5 sec',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'The length of words: 3',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Frequency of words: high',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      child: const Text('Close'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        child: const Icon(Icons.info, size: 30)),
                    const SizedBox(height: 32),
                    const LineChart()
                  ],
                ),
              ))
        ],
      )),
    );
  }
}

class LineChart extends StatelessWidget {
  const LineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, 5),
      ChartData(2, 5),
      ChartData(3, 15),
      ChartData(4, 20),
      ChartData(5, 15),
      ChartData(6, 10),
      ChartData(7, 8),
      ChartData(8, 5),
      ChartData(9, 2),
      ChartData(10, 2),
    ];
    return SizedBox(
      // decoration: BoxDecoration(
      //   boxShadow: const [
      //     BoxShadow(
      //         color: Color.fromRGBO(0, 0, 0, 0.25),
      //         offset: Offset(4.0, 4.0),
      //         blurRadius: 4.0,
      //         spreadRadius: 3),
      //   ],
      //   border: Border.all(
      //     color: const Color.fromRGBO(0, 0, 0, 0.25),
      //     width: 1.0,
      //   ),
      //   borderRadius: const BorderRadius.all(Radius.circular(15)),
      //   gradient: const LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: [
      //       Color.fromRGBO(225, 225, 225, 1),
      //       Color.fromRGBO(255, 207, 81, 1),
      //     ],
      //   ),
      // ),
      height: 300,
      child: SfCartesianChart(
          title: ChartTitle(text: ''),
          primaryXAxis: NumericAxis(
            title: AxisTitle(text: 'Number of correct words'),
            maximum: 10,
          ),
          primaryYAxis: NumericAxis(
            title: AxisTitle(text: 'Number of participants'),
            maximum: 20,
            minimum: 0,
          ),
          series: <ChartSeries>[
            // Renders line chart
            LineSeries<ChartData, int>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y)
          ]),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
