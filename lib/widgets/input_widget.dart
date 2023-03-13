import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class InputWidget extends StatefulWidget {
  TextEditingController controller;
  String hintName;
  bool isPassword = false;
  bool isEmail = false;
  InputWidget({Key? key, required this.controller, required this.hintName, isPassword, isEmail }  )
      : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        // border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (value) {
          setState(() {});
        },
        keyboardType: widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
         obscureText: widget.isEmail ? false : true,
        style: const TextStyle(
            fontWeight: FontWeight.w400, color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          hintText: widget.hintName,
          filled: true,
          contentPadding: const EdgeInsets.only(left: 15, bottom: 15),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
