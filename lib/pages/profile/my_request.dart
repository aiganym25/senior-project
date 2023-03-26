import 'package:flutter/material.dart';
import 'package:senior_project/widgets/experiment_widget.dart';

class MyRequests extends StatefulWidget {
  const MyRequests({Key? key}) : super(key: key);

  @override
  State<MyRequests> createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
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
            'Requests',
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
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      "Experiment 1",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'ospan.aiganym@gmail.com',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 100,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 183, 152, 1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Accept",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(178, 2, 2, 1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Reject",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
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
