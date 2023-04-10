import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/providers/experiment_mv.dart';

class ExperimentWidget extends StatefulWidget {
  final String title;
  final String description;
  final String creator;
  final int id;
  const ExperimentWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.creator,
      required this.id})
      : super(key: key);

  @override
  State<ExperimentWidget> createState() => _ExperimentWidgetState();
}

class _ExperimentWidgetState extends State<ExperimentWidget> {
  String firstHalf = '';
  String secondHalf = '';

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.description.length > 50) {
      firstHalf = widget.description.substring(0, 50);
      secondHalf = widget.description.substring(50, widget.description.length);
    } else {
      firstHalf = widget.description;
      secondHalf = "";
    }
  }

  bool isSendRequest = false;
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ExperimentParametersMV>(context);

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.title[0].toUpperCase()}${widget.title.substring(1).toLowerCase()}',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 8,
            ),
            secondHalf.isEmpty
                ? Text(firstHalf)
                : Column(
                    children: <Widget>[
                      Text(
                        flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              flag ? "show more" : "show less",
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                      ),
                    ],
                  ),
            const SizedBox(
              height: 8,
            ),
            RichText(
              text: TextSpan(
                text: 'Creater: ',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: widget.creator,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSendRequest = true;
                  });

                  model.sendRequest(widget.id);
                },
                child: Container(
                  width: 110,
                  height: 50,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: isSendRequest == false
                        ? const Color.fromRGBO(29, 119, 255, 1)
                        : const Color.fromRGBO(222, 222, 222, 1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: isSendRequest == false
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
            ),
          ],
        ));
  }
}
