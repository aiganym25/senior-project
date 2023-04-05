import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/providers/request_mv.dart';

class MyRequests extends StatefulWidget {
  String title;
  MyRequests({Key? key, required this.title}) : super(key: key);

  @override
  State<MyRequests> createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  @override
  Widget build(BuildContext context) {
    bool isAccepted =
        context.select((RequestedExperimentsMV mv) => mv.isAccepted);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(248, 180, 1, 1),
          title: Text(
            widget.title,
            style: const TextStyle(
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
                        return AnimatedOpacity(
                          opacity: !isAccepted ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              margin: const EdgeInsets.only(bottom: 20),
                              width: double.infinity,
                              // height: 150,
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
                                children: [
                                  const Text(
                                    'ospan.aiganym@gmail.com',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Provider.of<RequestedExperimentsMV>(
                                                  context,
                                                  listen: false)
                                              .changeIsAccepted();
                                        },
                                        child: Container(
                                          width: 100,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15),
                                          decoration: const BoxDecoration(
                                            color:
                                                Color.fromRGBO(0, 183, 152, 1),
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
                              )),
                        );
                      },
                    )
                  ],
                ),
              )),
            ]),
          ),
        ));
  }
}
