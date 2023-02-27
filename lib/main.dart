import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:senior_project/widgets/body_screen.dart';
import 'package:senior_project/widgets/fill_in.dart';
import 'package:senior_project/widgets/first_page.dart';

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
        home: const FirstPage(),
        routes: {
          '/home_page': (context) => const FirstPage(),
          '/body_screen': (context) => const BodyScreen(),
          '/fillIn' : (context) => const FillInWords(),
        },
        initialRoute: '/home_page',
      ),
    );
  }
}
