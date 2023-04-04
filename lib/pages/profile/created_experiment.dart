import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/models/get_experiment.dart';
import 'package:senior_project/pages/profile/view_result.dart';
import 'package:senior_project/pages/providers/experiment_mv.dart';
import 'package:senior_project/widgets/buttons/button.dart';
import 'package:senior_project/pages/profile/new_exp_param_page.dart';
import 'package:senior_project/widgets/experiment_widget.dart';
import 'package:http/http.dart' as http;

class CreatedExperiment extends StatefulWidget {
  int id;
  String title;
  CreatedExperiment({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  State<CreatedExperiment> createState() => _CreatedExperimentState();
}

class _CreatedExperimentState extends State<CreatedExperiment> {
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
            'Created',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        body: SafeArea( 
          child:
          
          
           FutureBuilder(
              future: model.getMyCreatedexperiments(),
              builder: (BuildContext context,
                  AsyncSnapshot<http.Response> snapshot) {
                 print(snapshot.hasData);
                if (snapshot.hasData) {
                  var experiments = jsonDecode(snapshot.data!.body);
                  return Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 32,
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: experiments.length,
                                itemBuilder: (context, index) {
                                  var experiment =
                                      MyCreatedExperiments.fromJson(
                                          experiments[index]);
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              ViewResult(pinCode: 'Exp1'),
                                        ),
                                      );
                                    },
                                    child: ExperimentWidget(
                                      title: experiment.experimentName,
                                      description: experiment.description,
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                  return ChangeNotifierProvider<
                                      ExperimentParametersMV>(
                                    create: (_) => ExperimentParametersMV(),
                                    child: NewExperimentPage(),
                                  );
                                },
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ButtonWidget(
                              txt: 'Create a new experiment',
                            ),
                          )),
                    ],
                  ); // display the data in a Text widget
                } else if (snapshot.data!.statusCode == 403) {
                  //  print(snapshot.data.statusCode);
                  return Column(
                    children: [
                      const Expanded(
                        child: Center(
                          child: Text('No created experiments',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 20)),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                  return ChangeNotifierProvider<
                                      ExperimentParametersMV>(
                                    create: (_) => ExperimentParametersMV(),
                                    child: NewExperimentPage(),
                                  );
                                },
                              ),
                            );
                          },
                          child: ButtonWidget(
                            txt: 'Create a new experiment',
                          )),
                    ],
                  ); // show a loading indicator while waiting for data
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
       
       
        ));
  }
}
