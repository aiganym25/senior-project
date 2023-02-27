import 'package:flutter/material.dart';

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
        body: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
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
                      );
                    },
                  ),
                ),
                // const SizedBox(height: 16,),

                Expanded(
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.only(bottom: 16.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(131, 89, 227, 1),
                    ),
                    child: const Center(
                      child: Text('Create a new experiment',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18)),
                    ),
                  ),
                ),
              ],
            )));
  }
}
