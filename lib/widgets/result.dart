import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const.dart';

class Result extends StatefulWidget {
  Result({Key? key, required this.words}) : super(key: key);
  List<String> words;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List<bool> isCorrect = List.filled(listOfWords.length, false);
  int correctWords = 0;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < listOfWords.length; i++) {
      if (listOfWords.contains(widget.words[i])) {
        correctWords++;
      }
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 198, 233),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.h),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Text(
                    'Results',
                    style: GoogleFonts.livvic(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'You remembered $correctWords words out of  ${listOfWords.length}: ',
                    style: GoogleFonts.livvic(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 32,),
                  Expanded(
                    child: ListView.builder(
                        itemCount: listOfWords.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
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
                                      color: listOfWords
                                              .contains(widget.words[index])
                                          ? Colors.black
                                          : Colors.red,
                                    ),
                                  ),
                                  listOfWords.contains(widget.words[index])
                                      ? Image.asset("assets/correct.png")
                                      : Image.asset("assets/incorrect.png"),
                                ],
                              ));
                        }),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('home_page');
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromRGBO(131, 89, 227, 1),
                      ),
                      child: const Center(
                        child: Text('Try again',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18)),
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
