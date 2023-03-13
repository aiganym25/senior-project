import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/view_result.dart';
import 'package:senior_project/providers/experiment_mv.dart';
import 'package:senior_project/widgets/buttons/button.dart';
import 'package:senior_project/pages/new_exp_param_page.dart';

class CreatedExperiment extends StatefulWidget {
  const CreatedExperiment({Key? key}) : super(key: key);

  @override
  State<CreatedExperiment> createState() => _CreatedExperimentState();
}

class _CreatedExperimentState extends State<CreatedExperiment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 32),
                height: MediaQuery.of(context).size.height * 0.60,
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => ViewResult(
                              pinCode: 'B5TH$index',
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text('B5TH$index',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 32))),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // const SizedBox(height: 16,),

            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return ChangeNotifierProvider<ExperimentParametersMV>(
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
        ));
  }
}
