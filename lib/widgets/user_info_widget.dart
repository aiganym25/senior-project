import 'package:flutter/material.dart';
class UserInfo extends StatelessWidget {
  final String label;
  final String value;
  final double? size;
  const UserInfo({required this.label, required this.value, this.size, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: '$label: ',
            style: TextStyle(
                fontSize: size ?? 18, fontWeight: FontWeight.bold, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: value,
                style: TextStyle(
                    fontSize: size ?? 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
