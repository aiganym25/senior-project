import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:senior_project/pages/experiment/animated_cards.dart';
import 'package:senior_project/pages/experiment/fill_in_page.dart';
import 'package:senior_project/pages/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: {
          '/home_page': (context) => const HomePage(),
          '/body_screen': (context) => const AnimatedCardsPage(),
          '/fillIn' : (context) => const FillInWords(),
        },
        initialRoute: '/home_page',
      ),
    );
  }
}
