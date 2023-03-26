import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/providers/request_mv.dart';

class JoinableCard extends StatefulWidget {
  const JoinableCard({Key? key}) : super(key: key);

  @override
  State<JoinableCard> createState() => _JoinableCardState();
}

class _JoinableCardState extends State<JoinableCard> {
  @override
  Widget build(BuildContext context) {
    String requestStatus =
        context.select((RequestedExperimentsMV mv) => mv.requestStatus);
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
        width: 20,
        height: 100,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 160.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "Experiment 1",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    'This is the experiment for',
                    maxLines: 1,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (requestStatus == 'null') {
                  Provider.of<RequestedExperimentsMV>(context, listen: false)
                      .changeRequestStatus();
                }
              },
              child: Container(
                width: 110,
                height: 50,
                decoration: BoxDecoration(
                  color: requestStatus == 'null'
                      ? const Color.fromRGBO(29, 119, 255, 1)
                      : const Color.fromRGBO(222, 222, 222, 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: requestStatus == 'null'
                      ? const Text(
                          "Send Request",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                      : const Text(
                          "In progress",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                ),
              ),
            ),
          ],
        ));
  }
}
