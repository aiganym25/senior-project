import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:senior_project/pages/user_main_page/user_page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ViewResult extends StatelessWidget {
  String pinCode;
  ViewResult({Key? key, required this.pinCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(102, 191, 186, 1),
              Color.fromRGBO(143, 137, 241, 0.85),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Column(
            children: [
              // const SizedBox(height: 16,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const UserPage(),
                    ),
                  );
                },
                child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.home_outlined, size: 40)),
              ),
              const SizedBox(height: 16),
              const Text(
                "Results of the experiment",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              pinCode,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 24),
                            ),
                            GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          // title: Text(
                                          //   'Pin of experiment: $pinCode',
                                          //   style: const TextStyle(
                                          //       fontWeight: FontWeight.w700,
                                          //       fontSize: 24),
                                          // ),
                                          content: SizedBox(
                                            height: 130.h,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  'Number of words: 10',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  'Word show time: 1.5 sec',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  'The length of words: 3',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  'Frequency of words: high',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                child: const Icon(Icons.info, size: 30))
                          ],
                        ),
                        const SizedBox(height: 32),
                        const LineChart()
                      ],
                    ),
                  ))
            ],
          )),
        ));
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
