import 'package:flutter/material.dart';
import 'package:senior_project/pages/feed-home/experiment/result_page.dart';

import '../../const.dart';

class TakenExperiments extends StatefulWidget {
  const TakenExperiments({Key? key}) : super(key: key);

  @override
  State<TakenExperiments> createState() => _TakenExperimentsState();
}

class _TakenExperimentsState extends State<TakenExperiments> {
  List<String> words = List.filled(listOfWords.length, "");

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
            'Taken',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
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
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16,),
                            margin: const EdgeInsets.only(bottom: 20),
                            width: double.infinity,
                            height: 150,
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Experiment 1",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const Text(
                                  'Creater: experimentator@gmail.com',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            Result(words: words),
                                      ),
                                    );
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      width: 110,
                                      height: 50,
                                      // padding: const EdgeInsets.symmetric(horizontal: 5),
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
                      },
                    ),
                  ],
                ),
              )),
            ]),
          ),
        ));
  }
}
