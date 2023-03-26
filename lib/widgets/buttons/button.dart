import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ButtonWidget extends StatelessWidget {
  String txt;
  ButtonWidget({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(248, 180, 1, 1),
      ),
      child: Center(
        child: Text(txt,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20)),
      ),
    );
  }
}
