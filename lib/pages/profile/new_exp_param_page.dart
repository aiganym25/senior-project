import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/profile/created_experiment.dart';
import 'package:senior_project/repo/base_client.dart';
import 'package:senior_project/models/experiment.dart';
import 'package:senior_project/pages/providers/experiment_mv.dart';
import 'package:senior_project/widgets/buttons/button.dart';
import 'package:senior_project/models/get_experiment.dart';

class NewExperimentPage extends StatefulWidget {
  const NewExperimentPage({Key? key}) : super(key: key);

  @override
  State<NewExperimentPage> createState() => _NewExperimentPageState();
}

class _NewExperimentPageState extends State<NewExperimentPage> {
  @override
  Widget build(BuildContext context) {
    final experimentParameters = context.watch<ExperimentParametersMV>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(248, 180, 1, 1),
        title: const Text(
          'Experiment parameters',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    TitleOfExperiment(),
                    NumberOfWordsInput(),
                    Time(),
                    LengthWords(),
                    FrequencyWords(),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () async {
                    print('title of the experiment');
                    var title = context.read<ExperimentParametersMV>().title;
                    var numberOfWords =
                        context.read<ExperimentParametersMV>().numberOfWords;
                    var upperLimit =
                        context.read<ExperimentParametersMV>().upperLimit;
                    var lowerLimit =
                        context.read<ExperimentParametersMV>().lowerLimit;
                    var wordShowTime =
                        context.read<ExperimentParametersMV>().wordShowTime;
                    print(title);
                    var newExperiment = NewExperiment(
                        name: title,
                        description: "description of ${title}",
                        numberOfWords: numberOfWords,
                        numberOfSecondsPerWord: wordShowTime,
                        frequencyRange: [lowerLimit, upperLimit],
                        lengthOfWords: [3]);

                    var activityData = newExperiment.toJson();
                    if (activityData != null) {
                      print(activityData);
                      // var body = jsonEncode(activityData);
                      // ... rest of the code
                    } else {
                      print('activityData is null');
                    }
                    try {
                      var response = await BaseClient().postExperiment(
                          'https://my-spring-app-sp.herokuapp.com/api/v1/experiment/newExperiment',
                          activityData);
                      print(response.body);
                      int id = GetExperiment.fromJson(jsonDecode(response.body))
                          .data
                          .experimentId;
                      // print(id);
                      Provider.of<ExperimentParametersMV>(context,
                              listen: false)
                          .isEmpty = false;
                      // Provider.of<ExperimentParametersMV>(context,
                      //         listen: false)
                      //     .experimentId = id;
                      experimentParameters.setId(id);
                      print(experimentParameters.id);
                      // Navigator.pushNamed(context, '/my_created_experiments');
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              CreatedExperiment(id: experimentParameters.id, title:  experimentParameters.title),
                        ),
                      );
                    } catch (er) {
                      print('eror');
                      print(er);
                    }

                    // var getRequest = await BaseClient().getExperiments(
                    //     'https://my-spring-app-sp.herokuapp.com/api/v1/experiment/getExperiment/1');
                    // print(getRequest);
                  },
                  child: ButtonWidget(txt: 'Create')),
            ],
          ),
        ),
      ),
    );
  } // var jsonString = newExperiment.toJson();
  // print(newExperiment.toJson());
  // print(newExperiment.toJson().runtimeType);

  // print(response);
  // print('upper');
  // print(context
  //     .read<ExperimentParametersMV>()
  //     .upperLimit);
  // print('lower');
  // print(context
  //     .read<ExperimentParametersMV>()
  //     .upperLimit);
  // print('length of words');
  // print(context
  //     .read<ExperimentParametersMV>()
  //     .lengthOfWords);
  // print('number of words');

  // print('show time');
  // print(context
  //     .read<ExperimentParametersMV>()
  //     .timeShowTime);

  // context.select((ExperimentParametersMV mv) {
  //   mv.setNumberOfWords(wordController.value);
  //   mv.setRangeOfWords(upperLimitController.value,
  //       lowerLimitController.value);
  //   mv.setTimeShowTime(
  //       wordShowTimeController.value);
  // });
}

class FrequencyWords extends StatefulWidget {
  const FrequencyWords({
    Key? key,
  }) : super(key: key);

  @override
  State<FrequencyWords> createState() => _FrequencyWordsState();
}

class _FrequencyWordsState extends State<FrequencyWords> {
  String _selectedItem = '5000 - 10000'; // initial selected item

  final List<String> _items = [
    '5000 - 10000',
    '10000 - 15000',
    '15000 - 20000',
    '20000 - 25000',
  ];
  final upperLimitController = TextEditingController();
  final lowerLimitController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Frequency of words in the range [5000 - 25000]",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Lower limit",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 38,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
              controller: lowerLimitController,
              onChanged: (value) {
                Provider.of<ExperimentParametersMV>(context, listen: false)
                    .lowerLimit = int.parse(value);
              },
              keyboardType: TextInputType.number,
              style: GoogleFonts.livvic(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 17),
              decoration: const InputDecoration(
                hintText: '5000',
                filled: true,
                contentPadding: EdgeInsets.only(left: 15, bottom: 12),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Upper limit",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 38,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
              controller: upperLimitController,
              onChanged: (value) {
                Provider.of<ExperimentParametersMV>(context, listen: false)
                    .upperLimit = int.parse(value);
              },
              keyboardType: TextInputType.number,
              style: GoogleFonts.livvic(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 17),
              decoration: const InputDecoration(
                hintText: '25000',
                filled: true,
                contentPadding: EdgeInsets.only(left: 15, bottom: 15),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              )),
        ),
      ]),
    );
  }
}

class LengthWords extends StatefulWidget {
  const LengthWords({Key? key}) : super(key: key);

  @override
  State<LengthWords> createState() => _LengthWordsState();
}

class _LengthWordsState extends State<LengthWords> {
  final int _selectedItem = 3; // initial selected item

  final List<int> _items = [
    3,
    4,
    5,
  ]; // list of items

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "Choose the length of words",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        const SizedBox(
          height: 16,
        ),
        DropdownButton(
          isExpanded: true,
          value: _selectedItem,
          onChanged: (newValue) {
            Provider.of<ExperimentParametersMV>(context, listen: false)
                .lengthOfWords = _selectedItem;
          },
          items: _items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            );
          }).toList(),
        )
      ]),
    );
  }
}

class Time extends StatefulWidget {
  const Time({Key? key}) : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  final wordShowTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Word show time in sec",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // border: Border.all(color: Colors.grey),
              ),
              child: TextFormField(
                controller: wordShowTimeController,
                onChanged: (value) {
                  Provider.of<ExperimentParametersMV>(context, listen: false)
                      .wordShowTime = double.parse(value);
                },
                // keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 18),
                decoration: const InputDecoration(
                  hintText: '1.5',
                  filled: true,
                  contentPadding: EdgeInsets.only(left: 15, bottom: 15),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            )
          ],
        ));
  }
}

class NumberOfWordsInput extends StatefulWidget {
  const NumberOfWordsInput({Key? key})
      : super(
          key: key,
        );

  @override
  State<NumberOfWordsInput> createState() => _NumberOfWordsInputState();
}

class _NumberOfWordsInputState extends State<NumberOfWordsInput> {
  final numberOfWordsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Number of words",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
                controller: numberOfWordsController,
                onChanged: (value) {
                  Provider.of<ExperimentParametersMV>(context, listen: false)
                      .numberOfWords = int.parse(value);
                },
                keyboardType: TextInputType.number,
                style: GoogleFonts.livvic(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 22),
                decoration: const InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.only(left: 15, bottom: 15),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                )),
          ),
        ],
      ),
    );
  }
}

class TitleOfExperiment extends StatefulWidget {
  const TitleOfExperiment({Key? key})
      : super(
          key: key,
        );

  @override
  State<TitleOfExperiment> createState() => _TitleOfExperimentState();
}

class _TitleOfExperimentState extends State<TitleOfExperiment> {
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Title of the experiment",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
                controller: titleController,
                onChanged: (value) {
                  Provider.of<ExperimentParametersMV>(context, listen: false)
                      .title = value;
                },
                keyboardType: TextInputType.number,
                style: GoogleFonts.livvic(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 22),
                decoration: const InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.only(left: 15, bottom: 15),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                )),
          ),
        ],
      ),
    );
  }
}
