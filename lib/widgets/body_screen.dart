import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senior_project/const.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({Key? key}) : super(key: key);

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> messageAnimation;

  var index = 0;
  bool isLast = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    messageAnimation = Tween<Offset>(
      begin: const Offset(16.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.ease,
        ),
      ),
    );
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(221, 165, 248, 1),
            Color.fromRGBO(255, 255, 225, 0.85),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 100.0.h),
                child: Center(
                  child: Text(
                    'Try to remember words!',
                    style: GoogleFonts.livvic(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                height: 250.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFD8D7D7),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: DefaultTextStyle(
                    style: GoogleFonts.livvic(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    child: FadeAnimatedTextKit(
                      onFinished: () =>
                          Navigator.pushNamed(context, '/fillIn'),
                      repeatForever: false,
                      totalRepeatCount: 1,
                      duration: const Duration(milliseconds: 1500),
                      text: listOfWords,
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
