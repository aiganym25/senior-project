import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/providers/request_mv.dart';
import 'package:senior_project/widgets/cards/request_card.dart';

class RequestedExperimentPage extends StatefulWidget {
  const RequestedExperimentPage({Key? key}) : super(key: key);

  @override
  State<RequestedExperimentPage> createState() =>
      _RequestedExperimentPageState();
}

class _RequestedExperimentPageState extends State<RequestedExperimentPage> {
  @override
  Widget build(BuildContext context) {
    String status = context.select((RequestedExperimentsMV mv) => mv.status);
    return Column(
      children: [
        RequestCard(index: 1, status: 'accepted'),
        const SizedBox(
          height: 32,
        ),
        RequestCard(index: 2, status: 'rejected'),
        const SizedBox(
          height: 32,
        ),
        RequestCard(index: 3, status: 'in progress')
        // ListView.builder(
        //   physics: const NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   itemCount: 2,
        //   itemBuilder: (context, index) => RequestCard(index: index, status: status),
        // )
      ],
    );
  }
}
