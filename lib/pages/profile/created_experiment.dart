import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/repo/base_client.dart';
import 'package:senior_project/pages/profile/view_result.dart';
import 'package:senior_project/providers/experiment_mv.dart';
import 'package:senior_project/widgets/buttons/button.dart';
import 'package:senior_project/pages/profile/new_exp_param_page.dart';
import 'package:senior_project/widgets/experiment_widget.dart';

class CreatedExperiment extends StatefulWidget {
  const CreatedExperiment({Key? key}) : super(key: key);

  @override
  State<CreatedExperiment> createState() => _CreatedExperimentState();
}

class _CreatedExperimentState extends State<CreatedExperiment> {
  @override
  Widget build(BuildContext context) {

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
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
                          itemCount: 2,
                          itemBuilder: (context, index) {
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
                                title: 'Experiment ${index + 1}',
                                description: 'The experiment is done with the purpose to identify the pattern in memorizing ...',
                              ),
                            );
                          },
                        ),
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
                              child: const NewExperiment(),
                            );
                          },
                        ),
                      );
                    },
                    child: ButtonWidget(
                      txt: 'Create a new experiment',
                    )),
              ],
            ),
          ),
        ));
  }
}
