import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project/widgets/my_taken_experiment.dart';
import '../providers/experiment_mv.dart';

class TakenExperiments extends StatefulWidget {
  const TakenExperiments({Key? key}) : super(key: key);

  @override
  State<TakenExperiments> createState() => _TakenExperimentsState();
}

class _TakenExperimentsState extends State<TakenExperiments> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ExperimentParametersMV>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(248, 180, 1, 1),
          title: const Text(
            'Taken',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        body: SafeArea(
            child: FutureBuilder(
                future: model.getMyTakenExperiemnts(),
                builder: (BuildContext context,
                    AsyncSnapshot<http.Response> snapshot) {
                  if (snapshot.hasData) {
                    var experiments = jsonDecode(snapshot.data!.body)['data'];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          Expanded(
                            child: experiments.isNotEmpty
                                ? SingleChildScrollView(
                                    physics: const ScrollPhysics(),
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: experiments.length,
                                        itemBuilder: (context, index) {
                                          var experiment = experiments[index];
                                          return TakenExperimentWidget(
                                              experiment: experiment);
                                        }),
                                  )
                                : const Center(
                                    child: Text(
                                        'You have not taken any experiment',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 20)),
                                  ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
  }
}
