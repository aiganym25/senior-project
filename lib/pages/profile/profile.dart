import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:senior_project/pages/login.dart';
import 'package:senior_project/pages/profile/my_request.dart';
import 'package:senior_project/pages/sign_up.dart';
import 'package:senior_project/pages/profile/taken_exp.dart';
import 'package:senior_project/pages/profile/created_experiment.dart';
import 'package:senior_project/widgets/container_widget.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<Widget> widgets = [const CreatedExperiment(), const MyRequests(), const TakenExperiments()];
  List<String> titles = [
    'My created experiments',
    'Requests to my experiments',
    'My taken experiments'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(248, 180, 1, 1),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/avatars/female.jpg',
                      height: 130,
                      width: 150,
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'John Doe',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  ListOfContainers(
                      numberOfContainers: 3, widgets: widgets, titles: titles),
                ],
              ),
            ),
          ),
        ));
  }
}
