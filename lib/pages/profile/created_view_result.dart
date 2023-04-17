import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import '../../widgets/expandable_container.dart';
import '../../widgets/user_info_widget.dart';
import '../providers/experiment_mv.dart';

class CreatedViewResult extends StatefulWidget {
  final int id;
  const CreatedViewResult({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<CreatedViewResult> createState() => _CreatedViewResultState();
}

class _CreatedViewResultState extends State<CreatedViewResult> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ExperimentParametersMV>(context);

    final participants = model.results;
    // print()
// print(widget.id);
    return Scaffold(
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
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: FutureBuilder(
                future: model.getCreatedExpResultsById(widget.id),
                builder: (BuildContext context,
                    AsyncSnapshot<http.Response> snapshot) {
                  if (snapshot.hasData) {
                    var results = jsonDecode(snapshot.data!.body)['data'];
                    final len = results['words'].length;
                    final wordShowTime = results['wordTime'];
                    final betweenWords = results['betweenWordTime'];
                    final lengthOfWords = results['lengthOfWords'];
                    final freqRange = results['frequencyRange'];
                    // print(results);
                    final participantCount = results['participantCount'];
                    // print(results);
                    // model.getListOfParticipants(results['experimentId']);
                    // print(model.results);
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 32),
                          ExpandableContainer(
                            title: 'Parameters of the experiment',
                            body: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Number of words: $len',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Word show time:   $wordShowTime sec',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Interval between showing words: $betweenWords sec',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  lengthOfWords != null
                                      ? Text(
                                          'The length of words: $lengthOfWords',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        )
                                      : const SizedBox.shrink(),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  freqRange != null
                                      ? Text(
                                          'Frequency of words: $freqRange',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        )
                                      : const SizedBox.shrink(),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ]),
                          ),
                          const SizedBox(height: 32),
                          participantCount != 0
                              ? Column(
                                  children: [
                                    ExpandableContainer(
                                        title:
                                            'Recall Frequency of Experiment Words Plotted by Word Index',
                                        body: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.25),
                                                      offset: Offset(4.0, 4.0),
                                                      blurRadius: 4.0,
                                                      spreadRadius: 3),
                                                ],
                                                border: Border.all(
                                                  color: const Color.fromRGBO(
                                                      0, 0, 0, 0.25),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15)),
                                                gradient: const LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Color.fromRGBO(
                                                        225, 225, 225, 1),
                                                    Color.fromRGBO(
                                                        255, 207, 81, 1),
                                                  ],
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0,
                                                        vertical: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    const SizedBox(height: 10),
                                                    GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                content: const Text(
                                                                    'This graph displays the frequency at which each word used in the experiment was successfully recalled by participants.\n\nThe y-axis represents the index of each word in the original array, while the x-axis shows the number of times each word was successfully recalled',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w400)),
                                                                actions: [
                                                                  TextButton(
                                                                    style: TextButton
                                                                        .styleFrom(
                                                                      textStyle: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .labelLarge,
                                                                    ),
                                                                    child: const Text(
                                                                        'Close'),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child: const Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Icon(
                                                              Icons.info,
                                                              color:
                                                                  Colors.black,
                                                              size: 30)),
                                                    ),
                                                    LineChart(
                                                        y: results[
                                                            'overallResults'],
                                                        x: results['words']),
                                                    const SizedBox(height: 10),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const Text(
                                              'A list of words used in this experiment: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            SizedBox(
                                              height: 40,
                                              child: Wrap(
                                                direction: Axis.horizontal,
                                                children: List.generate(
                                                  results['words'].length,
                                                  (index) => index !=
                                                          results['words']
                                                                  .length -
                                                              1
                                                      ? Text(
                                                          '${results['words'][index]}, ',
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16,
                                                          ),
                                                        )
                                                      : Text(
                                                          '${results['words'][index]}',
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                    const SizedBox(height: 32),
                                    ExpandableContainer(
                                        title:
                                            'Participants distribution by gender',
                                        body: GenderChart(
                                          participants: participants,
                                        )),
                                    const SizedBox(height: 32),
                                    ExpandableContainer(
                                      title: 'A list of participants',
                                      body: DataTable(
                                          dataRowHeight: 120,
                                          columns: const [
                                            DataColumn(label: Text('Name')),
                                            DataColumn(
                                                label:
                                                    Text('User Information')),
                                          ],
                                          rows: participants.map((el) {
                                            return DataRow(cells: [
                                              DataCell(
                                                Text(
                                                    "${el['participant']['firstName']} ${el['participant']['lastName']}"),
                                              ),
                                              DataCell(Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 10),
                                                  UserInfo(
                                                      label: 'Email',
                                                      value: el['participant']
                                                          ['username'],
                                                      size: 15),
                                                  UserInfo(
                                                      label: "Gender",
                                                      value: el['participant']
                                                              ['age']
                                                          .toString(),
                                                      size: 15),
                                                  UserInfo(
                                                      label: "Gender",
                                                      value: el['participant']
                                                          ['gender'],
                                                      size: 15),
                                                  UserInfo(
                                                      label: "Degree",
                                                      value: el['participant']
                                                          ['degree'],
                                                      size: 15),
                                                ],
                                              ))
                                            ]);
                                          }).toList()),
                                    ),
                                  ],
                                )
                              : const Center(
                                  child: Text(
                                    'No one took this experiment yet',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18),
                                  ),
                                ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                        child: Text('Sorry, try again!',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 18)));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ))),
    );
  }
}

class LineChart extends StatelessWidget {
  final List<dynamic> x;
  final List<dynamic> y;
  const LineChart({Key? key, required this.x, required this.y})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<int> xIndex = List.generate(x.length, (index) => index++);

    final List<ChartData> chartData = List.generate(
      xIndex.length,
      (index) => ChartData(index, y[index].toDouble()),
    );

    return SizedBox(
      height: 300,
      child: SfCartesianChart(
          title: ChartTitle(text: ''),
          primaryXAxis: NumericAxis(
            title: AxisTitle(text: 'Indexes of words'),
            interval: 1,
            maximum: xIndex[xIndex.length - 1].toDouble(),
          ),
          primaryYAxis: NumericAxis(
              title: AxisTitle(text: 'Number of recalled words'),
              maximum: y
                          .reduce((curr, next) => curr > next ? curr : next)
                          .toDouble() ==
                      0
                  ? 1
                  : y
                      .reduce((curr, next) => curr > next ? curr : next)
                      .toDouble(),
              interval: 1),
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

class GenderChart extends StatelessWidget {
  final dynamic participants;
  const GenderChart({
    Key? key,
    required this.participants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maleCount = participants.fold(
        0,
        (count, participant) => count +=
            (participant['participant']['gender'] == 'male' ||
                    participant['participant']['gender'] == 'Male' ||
                    participant['participant']['gender'] == 'm')
                ? 1
                : 0);

    final malePercentage = (maleCount / participants.length) * 100;

    final femaleCount = participants.fold(
        0,
        (count, participant) => count +=
            (participant['participant']['gender'] == 'female' ||
                    participant['participant']['gender'] == 'Female' ||
                    participant['participant']['gender'] == 'f')
                ? 1
                : 0);

    final femalePercentage = (femaleCount / participants.length) * 100;

    final otherCount = participants.fold(
        0,
        (count, participant) => count +=
            (participant['participant']['gender'] == 'other' ||
                    participant['participant']['gender'] == 'Other' ||
                    participant['participant']['gender'] == 'o')
                ? 1
                : 0);

    final otherPercentage = (otherCount / participants.length) * 100;

    final List<PieChartData> chartData = [
      PieChartData('Male', malePercentage),
      PieChartData('Female', femalePercentage),
      PieChartData('Other', otherPercentage),
    ].where((data) => data.percentage != 0.0).toList();
    return SizedBox(
      height: 300,
      child: SfCircularChart(
        series: <CircularSeries>[
          // Create pie series
          PieSeries<PieChartData, String>(
            dataSource: chartData,
            xValueMapper: (PieChartData data, _) => data.gender,
            yValueMapper: (PieChartData data, _) => data.percentage,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
            ),
            dataLabelMapper: (PieChartData data, _) => "${data.gender}\n${data.percentage}%"
          )
        ],
      ),
    );
  }
}

class PieChartData {
  final String gender;
  final double percentage;

  PieChartData(this.gender, this.percentage);
}
