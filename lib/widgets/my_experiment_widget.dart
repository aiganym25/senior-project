import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/providers/request_mv.dart';
import '../pages/profile/created_view_result.dart';
import '../pages/profile/my_request.dart';
import '../pages/providers/experiment_mv.dart';

class MyExperimentWidget extends StatefulWidget {
  final dynamic experiment;
  const MyExperimentWidget({Key? key, required this.experiment})
      : super(key: key);

  @override
  State<MyExperimentWidget> createState() => _MyExperimentWidgetState();
}

class _MyExperimentWidgetState extends State<MyExperimentWidget> {
  String firstHalf = '';
  String secondHalf = '';

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.experiment['description'].length > 50) {
      firstHalf = widget.experiment['description'].substring(0, 50);
      secondHalf = widget.experiment['description']
          .substring(50, widget.experiment['description'].length);
    } else {
      firstHalf = widget.experiment['description'];
      secondHalf = "";
    }
  }

  bool isDeleted = false;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ExperimentParametersMV>(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.experiment['experimentName'],
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                GestureDetector(
                    onTap: () async {
                      // Show confirmation dialog
                      bool confirmed = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Delete Experiment'),
                            content: const Text(
                                'Are you sure you want to delete this experiment?'),
                            actions: [
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                              ),
                              TextButton(
                                child: const Text('Delete'),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      if (confirmed == true) {
                        // Call the deleteExperimentById method and update the UI
                        final statusCode = await model.deleteExperimentById(
                            widget.experiment['experimentId']);
                        if (statusCode == 200) {
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Experiment deleted successfully')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Something gone wrong')));
                        }
                      }
                    },
                    child: const Icon(Icons.delete, size: 30)),
              ],
            ),
            const SizedBox(
              height: 16,
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
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    model.getListOfParticipants(widget.experiment['experimentId']);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CreatedViewResult(
                              id: widget.experiment['experimentId']);
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(0, 183, 152, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "View results",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ChangeNotifierProvider<RequestedExperimentsMV>(
                            create: (_) => RequestedExperimentsMV(),
                            child: MyRequests(
                                title: widget.experiment['experimentName'],
                                id: widget.experiment['experimentId']),
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(178, 2, 2, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "View requests",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
