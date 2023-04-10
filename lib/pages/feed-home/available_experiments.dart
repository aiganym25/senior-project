import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/providers/experiment_mv.dart';
import 'package:http/http.dart' as http;

import '../../widgets/experiment_widget.dart';
import '../../widgets/search_widget.dart';

class AvailableExperiments extends StatefulWidget {
  const AvailableExperiments({Key? key}) : super(key: key);

  @override
  State<AvailableExperiments> createState() => _AvailableExperimentsState();
}

class _AvailableExperimentsState extends State<AvailableExperiments> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ExperimentParametersMV>(context);
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                const SearchWidget(),
                FutureBuilder(
                  future: model.getAvailableExperiments(),
                  builder: (BuildContext context,
                      AsyncSnapshot<http.Response> snapshot) {
                    if (snapshot.hasData) {
                      var experiments = jsonDecode(snapshot.data!.body)['data'];
                      // print(experiments);
                      return Column(
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          experiments.isNotEmpty
                              ? ListView.builder(
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: experiments.length,
                                  itemBuilder: (context, index) {
                                    var experiment = experiments[index];
                                    return ExperimentWidget(
                                        title: experiment['experimentName'],
                                        description: experiment['description'],
                                        creator: experiment['creator']
                                            ['username'],
                                        id: experiment['experimentId']
                                        );
                                  },
                                )
                              : const Text('No available experiments',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18)),
                        ],
                      );
                    } else {
                      return const Center(
                          child: Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: CircularProgressIndicator(),
                      ));
                    }
                  },
                ),
              ],
            )));
  }
}
