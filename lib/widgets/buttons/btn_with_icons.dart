import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonWithIcons extends StatelessWidget {
  String txt;
  ButtonWithIcons({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 50),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(131, 89, 227, 1),
      ),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
              ),
              child: Icon(Icons.mail, color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(txt,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
