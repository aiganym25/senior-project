import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/authentication/auth_model.dart';
import 'package:senior_project/pages/authentication/authentication_page.dart';
import 'package:senior_project/pages/feed-home/experiment/animated_cards.dart';
import 'package:senior_project/pages/feed-home/experiment/fill_in_page.dart';
import 'package:senior_project/pages/profile/created_experiment.dart';
import 'package:senior_project/pages/profile/view_result.dart';
import 'package:senior_project/pages/providers/experiment_mv.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) => ChangeNotifierProvider(
        create: (_) => ExperimentParametersMV(),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AuthenticationPage(),
          routes: {
            '/view_results': (context) =>   ViewResult(),
            '/home_page': (context) => AuthProvider(
                model: AuthModel(), child: const AuthenticationPage()),
            '/body_screen': (context) => const AnimatedCardsPage(),
            '/fillIn': (context) => const FillInWords(),
            '/my_created_experiments': (context) =>
                CreatedExperiment(id: 1, title: 'Experiment 1'),
          },
          initialRoute: '/home_page',
        ),
      ),
    );
  }
}
