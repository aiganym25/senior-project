import 'package:flutter/material.dart';
import 'package:senior_project/widgets/cards/joinable_card.dart';

class AvailableExperiments extends StatefulWidget {
  const AvailableExperiments({Key? key}) : super(key: key);

  @override
  State<AvailableExperiments> createState() => _AvailableExperimentsState();
}

class _AvailableExperimentsState extends State<AvailableExperiments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return const JoinableCard();
          },
        ));
  }
}
