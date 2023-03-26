import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RequestCard extends StatelessWidget {
  String status;
  int index;
  RequestCard({Key? key, required this.index, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor = status == 'accepted'
        ? const Color.fromRGBO(121, 209, 194, 1)
        : (status == 'rejected'
            ? const Color.fromRGBO(209, 1, 1, 1)
            : const Color.fromRGBO(136, 136, 136, 1));
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          // margin: const EdgeInsets.only(bottom: 20),
          width: 315.w,
          height: 100,
          decoration: BoxDecoration(
            color: statusColor,
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
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Experiment ${index + 1}",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              RichText(
                text: TextSpan(children: [
                  const TextSpan(
                    text: 'Status: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: "$status",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ), // this is invisible
                ]),
              ),
            ],
          ),
        ),
        status == 'accepted'
            ? Positioned(
                left: MediaQuery.of(context).size.width - 120,
                child: Container(
                 height: 100,
                  width: 70,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(0, 0, 0, 0.25),
                        width: 1.0,
                      ),
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: SvgPicture.asset('assets/icons/next.svg',
                      fit: BoxFit.scaleDown),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
