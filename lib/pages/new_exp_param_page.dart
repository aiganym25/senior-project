import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/user_main_page/user_page.dart';
import 'package:senior_project/providers/experiment_mv.dart';
import 'package:senior_project/utils.dart';
import 'package:senior_project/widgets/buttons/button.dart';

class NewExperiment extends StatefulWidget {
  const NewExperiment({Key? key}) : super(key: key);

  @override
  State<NewExperiment> createState() => _NewExperimentState();
}

class _NewExperimentState extends State<NewExperiment> {
  final wordController = TextEditingController();
  final wordShowTimeController = TextEditingController();
  final upperLimitController = TextEditingController();
  final lowerLimitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(158, 225, 236, 1),
            Color.fromRGBO(229, 167, 224, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                children: [
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
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    width: double.infinity,
                    // height: 570,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Expanded(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Center(
                                child: Text(
                                  "Experiment parameters",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25.w),
                                ),
                              ),
                              SizedBox(height: 32.h),
                              NumberOfWordsInput(
                                  wordController: wordController),
                              SizedBox(height: 24.h),
                              Time(
                                  wordShowTimeController:
                                      wordShowTimeController),
                              SizedBox(
                                height: 24.h,
                              ),
                              const LengthWords(),
                              SizedBox(
                                height: 24.h,
                              ),
                              FrequencyWords(
                                  upperLimitController: upperLimitController,
                                  lowerLimitController: lowerLimitController),
                              SizedBox(height: 20.h),
                            ],
                          ),
                          GestureDetector(
                              onTap: () {
                                print(context
                                    .read<ExperimentParametersMV>()
                                    .numberOfWords);
                                print(context
                                    .read<ExperimentParametersMV>()
                                    .lowerLimit);
                                print(context
                                    .read<ExperimentParametersMV>()
                                    .upperLimit);
                                print(context
                                    .read<ExperimentParametersMV>()
                                    .timeShowTime);
                                print(context
                                    .read<ExperimentParametersMV>()
                                    .lengthOfWords);

                                // context.select((ExperimentParametersMV mv) {
                                //   mv.setNumberOfWords(wordController.value);
                                //   mv.setRangeOfWords(upperLimitController.value,
                                //       lowerLimitController.value);
                                //   mv.setTimeShowTime(
                                //       wordShowTimeController.value);
                                // });
                              },
                              child: ButtonWidget(txt: 'Create')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FrequencyWords extends StatefulWidget {
  var upperLimitController = TextEditingController();
  var lowerLimitController = TextEditingController();
  FrequencyWords({
    Key? key,
    required this.upperLimitController,
    required this.lowerLimitController,
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
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),

        const SizedBox(
          height: 10,
        ),
        const Text(
          "Lower limit",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
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
              controller: widget.lowerLimitController,
              onChanged: (value) {
                context.select((ExperimentParametersMV mv) => {
                  mv.setRangeOfWords(widget.upperLimitController.value, widget.lowerLimitController.value)
                });
                // words[index] = _controllers.text;
                // setState(() {});
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
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
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
              controller: widget.upperLimitController,
              onChanged: (value) {
                context.select((ExperimentParametersMV mv) {
                  mv.setRangeOfWords(widget.upperLimitController.value,
                      widget.lowerLimitController.value);
                });
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
        // const SizedBox(
        //   height: 10,
        // ),
        // DropdownButton(
        //   isExpanded: true,
        //   value: _selectedItem,
        //   onChanged: (newValue) {
        //     setState(() {
        //       _selectedItem = newValue.toString();
        //     });
        //   },
        //   items: _items.map((item) {
        //     return DropdownMenuItem(
        //       value: item,
        //       child: Text(item,
        //           style: const TextStyle(fontWeight: FontWeight.w600)),
        //     );
        //   }).toList(),
        // )
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
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        const SizedBox(
          height: 16,
        ),
        DropdownButton(
          isExpanded: true,
          value: _selectedItem,
          onChanged: (newValue) {
           
              context.select((ExperimentParametersMV mv) {
                mv.setLengthOfWords(newValue);
              });
           
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
  TextEditingController wordShowTimeController;
  Time({Key? key, required this.wordShowTimeController}) : super(key: key);

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  // double _currentSliderValue = 20;
  // final labels = ['0', '0.5', '1', '1.5', '2', '2.5'];
  // final double min = 0;
  // double indexTop = 0;
  // final double max = labels.length - 1.0;
  // final divisions = labels.length - 1;
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
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
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
                controller: widget.wordShowTimeController,
                onChanged: (value) {
                  // words[index] = _controllers![index].text;
                  context.select((ExperimentParametersMV mv) => {
                    mv.setTimeShowTime(value)
                  });
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
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: Utils.modelBuilder(labels, (index, model) {
            //       const selectedColor = Colors.black;
            //       final unselectedColor = Colors.black.withOpacity(0.3);
            //       final isSelected = index <= indexTop;
            //       // print(model);
            //       // print(isSelected);
            //       // print(indexTop);
            //       final color = isSelected ? selectedColor : unselectedColor;
            //       return Container(
            //         color: Colors.transparent,
            //         width: 30,
            //         child: Text(
            //           model.toString(),
            //           textAlign: TextAlign.center,
            //           style: const TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //           ).copyWith(color: color),
            //         ),
            //       );
            //     }),
            //   ),
            // ),
            // Slider(
            //   value: indexTop,
            //   max: 2.5,
            //   divisions: 5,
            //   label: indexTop.toString(),
            //   onChanged: (double value) {
            //     setState(() {
            //       indexTop = value;
            //     });
            //   },
            // ),
          ],
        ));
  }
}

class NumberOfWordsInput extends StatefulWidget {
  TextEditingController wordController;
  NumberOfWordsInput({Key? key, required this.wordController})
      : super(
          key: key,
        );

  @override
  State<NumberOfWordsInput> createState() => _NumberOfWordsInputState();
}

class _NumberOfWordsInputState extends State<NumberOfWordsInput> {
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
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
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
                controller: widget.wordController,
                onChanged: (value) {
                  context.select((ExperimentParametersMV mv) {
                    mv.setNumberOfWords(value);
                  });
                  // words[index] = _controllers.text;
                  // setState(() {});
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
