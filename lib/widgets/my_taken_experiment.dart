import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/feed-home/experiment/result_page.dart';
import '../pages/providers/experiment_mv.dart';

class TakenExperimentWidget extends StatelessWidget {
  const TakenExperimentWidget({
    Key? key,
    required this.experiment,
  }) : super(key: key);

  final experiment;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ExperimentParametersMV>(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
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
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experiment['experimentName'],
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                text: 'Creater: ',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: experiment['creator']['username'],
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () async{
                final response = await model.viewResultsTakenExperiments(experiment['experimentId']);
                
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        Result(id: 1 , words: response['data']['experiment']['words'], enteredWords: response['data']['participantResults']),
                  ),
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 110,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(29, 119, 255, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "View Result",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
