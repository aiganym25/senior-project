import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ListOfContainers extends StatelessWidget {
  int numberOfContainers;
  List<String> titles;
  List<Widget> widgets;
  ListOfContainers(
      {Key? key,
      required this.numberOfContainers,
      required this.widgets,
      required this.titles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: numberOfContainers,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => widgets[index]));
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 75.h,
                decoration: BoxDecoration(
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
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(225, 225, 225, 1),
                      Color.fromRGBO(255, 207, 81, 1),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      titles[index],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SvgPicture.asset('assets/icons/arrow_right.svg'),
                  ],
                )),
          );
        });
  }
}
