import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/providers/request_mv.dart';

import '../../pages/feed-home/experiment/animated_cards.dart';

class RequestCard extends StatefulWidget {
  final Map<String, dynamic> experiment;
  const RequestCard({Key? key, required this.experiment}) : super(key: key);

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  @override
  Widget build(BuildContext context) {
    Color statusColor = widget.experiment['status'] == 'JOINED'
        ? const Color.fromRGBO(121, 209, 194, 1)
        : (widget.experiment['status'] == 'REJECTED'
            ? const Color.fromRGBO(209, 1, 1, 1)
            : const Color.fromRGBO(136, 136, 136, 1));
    final status = widget.experiment['status'] == 'PENDING'
        ? 'in progress'
        : (widget.experiment['status'] == 'JOINED' ? 'accepted' : 'rejected');


    widget.experiment['status'] == 'JOINED';
    return GestureDetector(
      onTap: () {
        if (widget.experiment['status'] == 'JOINED') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: SizedBox(
                    height: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Do you want to participate in the experiment?',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Yes'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ChangeNotifierProvider<
                                      RequestedExperimentsMV>(
                                  create: (_) => RequestedExperimentsMV(),
                                  child: AnimatedCardsPage(
                                      id: widget.experiment['experiment']
                                          ['experimentId']));
                            },
                          ),
                        );
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Close'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              });
        }
      },
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              margin: const EdgeInsets.only(bottom: 20),
              width: 315.w,
              height: 100,
              decoration: BoxDecoration(
                color: statusColor,
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
                  Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      widget.experiment['experiment']['experimentName'],
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: 'Status: ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: status,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ), // this is invisible
                    ]),
                  ),
                ],
              ),
            ),
          ),
          widget.experiment['status'] == 'JOINED'
              ? Positioned(
                  left: MediaQuery.of(context).size.width - 90,
                  child: Container(
                    height: 100,
                    width: 70,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(0, 0, 0, 0.25),
                          width: 1.0,
                        ),
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                    child: SvgPicture.asset('assets/icons/next.svg',
                        fit: BoxFit.scaleDown),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
