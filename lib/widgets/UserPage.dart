import 'package:flutter/material.dart';
import 'package:senior_project/widgets/available_experiments.dart';
import 'package:senior_project/widgets/created_experimet.dart';
import 'package:senior_project/widgets/swipable_tabbar.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(167, 174, 249, 1),
            Color.fromRGBO(246, 198, 236, 1),
            Color.fromRGBO(248, 180, 1, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(children: const [
              Center(
                child: Text('Welcome, John',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 32)),
              ),
              SizedBox(height: 32),
              SwipableTabbar(childrens: [
                AvailableExperiments(),
                CreatedExperiment(),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
