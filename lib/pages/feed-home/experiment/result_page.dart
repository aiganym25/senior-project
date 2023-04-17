import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/providers/request_mv.dart';

class Result extends StatefulWidget {
  const Result(
      {Key? key,
      required this.words,
      required this.enteredWords,
      required this.id})
      : super(key: key);
  final List<String> enteredWords;
  final List<dynamic> words;
  final int id;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
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

    for (int i = 0; i < widget.words.length; i++) {
      if (widget.enteredWords.contains(widget.words[i])) {
        if (map[widget.enteredWords[i]] != 1) {
          isCorrectList[i] = true;
          correctWords++;
        } else {
          isCorrectList[i] = false;
        }
        map[widget.enteredWords[i]] = map[widget.enteredWords[i]]! + 1;
      } else {
        isCorrectList[i] = false;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RequestedExperimentsMV>(context);
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
              Expanded(
                child: ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.words.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.only(bottom: 32),
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row( 
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.words[index],
                                style: GoogleFonts.livvic(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: isCorrectList[index] == true
                                      ? Colors.black
                                      : Colors.red,
                                ),
                              ),
                              isCorrectList[index] == true
                                  ? Image.asset("assets/correct.png")
                                  : Image.asset("assets/incorrect.png"),
                            ],
                          ));
                    }),
              ),
              GestureDetector(
                onTap: () async {
                  final response =
                      await model.sendResults(widget.enteredWords, widget.id, context);
                  if (response.statusCode == 200) {
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Experiment is taken successfully')));
                  }
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
    );
  }
}
