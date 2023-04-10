import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/providers/experiment_mv.dart';
import 'package:senior_project/pages/profile/taken_exp.dart';
import 'package:senior_project/pages/profile/created_experiment.dart';
import 'package:senior_project/pages/providers/user_mv.dart';
import 'package:senior_project/widgets/container_widget.dart';
import '../authentication/authentication_page.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<Widget> widgets = [
    const CreatedExperiment(id: 1, title: 'Experiment 1'),
    const TakenExperiments()
  ];
  List<String> titles = ['My created experiments', 'My taken experiments'];
  late String? userName;


  @override
  Widget build(BuildContext context) {
    Provider.of<UserMV>(context).getUserinfo();
    // final userName = context.select((UserMV mv) => mv.userName);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 180, 1, 1),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const AuthenticationPage()),
            );
          },
          child: const Icon(Icons.logout_rounded, color: Colors.black),
          backgroundColor: Colors.white,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                context.select((UserMV mv) => mv.userName) ?? '',
                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
              ),
              const SizedBox(
                height: 50,
              ),
              ListOfContainers(
                  numberOfContainers: titles.length,
                  widgets: widgets,
                  titles: titles),
            ],
          ),
        ),
      )

          // child: FutureBuilder(
          //     future: model.getUserInfo(),
          //     builder:
          //         (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
          //       if (snapshot.hasData) {
          //         var experiments = jsonDecode(snapshot.data!.body)['data'];
          //         return Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 16),
          //           child: SingleChildScrollView(
          //             physics: const ScrollPhysics(),
          //             child: Column(
          //               children: [
          //                 const SizedBox(
          //                   height: 32,
          //                 ),
          //                 const Text(
          //                   '',
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.w800, fontSize: 32),
          //                 ),
          //                 SizedBox(
          //                   height: 30.h,
          //                 ),
          //                 ListOfContainers(
          //                     numberOfContainers: titles.length,
          //                     widgets: widgets,
          //                     titles: titles),
          //               ],
          //             ),
          //           ),
          //         );
          //       } else {
          //         return const Center(
          //             child: Padding(
          //           padding: EdgeInsets.only(top: 10),
          //           child: CircularProgressIndicator(),
          //         ));
          //       }
          //     }),
          ),
    );
  }
}
