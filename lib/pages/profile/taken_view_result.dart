import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senior_project/pages/profile/created_view_result.dart';

import '../../widgets/expandable_container.dart';

class TakenViewResult extends StatefulWidget {
  const TakenViewResult({
    Key? key,
    required this.experiment,
    required this.words,
    required this.enteredWords,
  }) : super(key: key);
  final List<dynamic> enteredWords;
  final List<dynamic> words;
  final dynamic experiment;

  @override
  State<TakenViewResult> createState() => _TakenViewResultState();
}

class _TakenViewResultState extends State<TakenViewResult> {
  int correctWords = 0;
  int count = 0;
  late Map<dynamic, int> map;
  late List<int> counts;
  late List<bool> isCorrectList;

  @override
  void initState() {
    counts = List.filled(widget.enteredWords.length, 0);
    map = Map.fromIterables(widget.enteredWords, counts);
    isCorrectList = List.filled(widget.enteredWords.length, false);

    for (int i = 0; i < widget.enteredWords.length; i++) {
      if (widget.enteredWords[i] == 1) {
        correctWords++;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 180, 1, 1),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(248, 180, 1, 1),
        title: const Text(
          'Results',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'You remembered $correctWords words out of  ${widget.words.length}: ',
                  style: GoogleFonts.livvic(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 32,
                ),
                ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.words.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.only(bottom: 32),
                          padding:
                              const EdgeInsets.only(left: 10, right: 10),
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.words[index],
                                style: GoogleFonts.livvic(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: widget.enteredWords[index] == 1
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              widget.enteredWords[index] == 1
                                  ? Image.asset("assets/correct.png")
                                  : Image.asset("assets/incorrect.png"),
                            ],
                          ));
                    }),
                ExpandableContainer(
                
                    title: 'Overall results of the experiment',
                    body: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
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
                            borderRadius: const BorderRadius.all(
                                Radius.circular(15)),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(225, 225, 225, 1),
                                Color.fromRGBO(255, 207, 81, 1),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: const Text(
                                                'This graph displays the frequency at which each word used in the experiment was successfully recalled by participants.\n\nThe y-axis represents the index of each word in the original array, while the x-axis shows the number of times each word was successfully recalled',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            actions: [
                                              TextButton(
                                                style:
                                                    TextButton.styleFrom(
                                                  textStyle:
                                                      Theme.of(context)
                                                          .textTheme
                                                          .labelLarge,
                                                ),
                                                child:
                                                    const Text('Close'),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop();
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: const Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.info,
                                          color: Colors.black, size: 30)),
                                ),
                                LineChart(
                                    y: widget
                                        .experiment['overallResults'],
                                    x: widget.experiment['words']),
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
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 40,
                          child: Wrap(
                            direction: Axis.horizontal,
                            children: List.generate(
                              widget.experiment['words'].length,
                              (index) => index !=
                                      widget.experiment['words'].length -
                                          1
                                  ? Text(
                                      '${widget.experiment['words'][index]}, ',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    )
                                  : Text(
                                      '${widget.experiment['words'][index]}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    )),
                
                const SizedBox(height: 32,),
                GestureDetector(
                  onTap: () {
                    // model.sendResults(widget.enteredWords, widget.id);
                    Navigator.pop(context);
                    // Navigator.pop(context);
                    // Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 198, 55, 44),
                    ),
                    child: const Center(
                      child: Text('Close',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
