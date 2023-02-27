import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dropdownvalueTimeForWords = '1.5';
  var dropdownvalueWordLength = '3';
  var dropdownvalueWordFrequency = 'high';
  var dropdownvalueRecallMode = 'any order';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 99, 184, 139),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: 
              SingleChildScrollView(
                child: Stack(children: [
                  Container(height: MediaQuery.of(context).size.height * 0.9 ),
                  const Intro_text(),
                  Categories(),
                  Positioned(
                      bottom: 0,
                      left: MediaQuery.of(context).size.width / 2 - 105.w,
                      // top: MediaQuery.of(context).size.height ,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/body_screen');
                        },
                        child: Image.asset(
                          'assets/button.png',
                          width: 180.w,
                          height: 45.h,
                        ),
                      ))
                ]),
              ),
            ),
          ),
        ));
  }

  Padding Categories() {
    return Padding(
      padding: const EdgeInsets.only(top: 150.0),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose number of words:',
              style: GoogleFonts.livvic(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 38,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.livvic(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 14),
                  decoration: const InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.only(left: 15, top: 3, bottom: 5),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  )),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Choose the length of the words:',
              style: GoogleFonts.livvic(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 38,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3F3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                alignment: AlignmentDirectional.bottomEnd,
                items: wordLength
                    .map((String item) =>
                        DropdownMenuItem<String>(child: Text(item), value: item))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownvalueWordLength = value!;
                  });
                },
                value: dropdownvalueWordLength,
                autofocus: false,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Choose words by frequency:',
              style: GoogleFonts.livvic(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 38,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 10, right: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3F3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                alignment: AlignmentDirectional.bottomEnd,
                items: wordsFrequency
                    .map((String item) =>
                        DropdownMenuItem<String>(child: Text(item), value: item))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownvalueWordFrequency = value!;
                  });
                },
                value: dropdownvalueWordFrequency,
                autofocus: false,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Choose the time for words to be shown (sec):',
              style: GoogleFonts.livvic(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 38,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3F3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                alignment: AlignmentDirectional.bottomEnd,
                items: timeForWords
                    .map((String item) =>
                        DropdownMenuItem<String>(child: Text(item), value: item))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownvalueTimeForWords = value!;
                  });
                },
                value: dropdownvalueTimeForWords,
                autofocus: false,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              'Choose the recall mode:',
              style: GoogleFonts.livvic(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 38,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3F3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton(
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                alignment: AlignmentDirectional.bottomEnd,
                items: recallMode
                    .map((String item) =>
                        DropdownMenuItem<String>(child: Text(item), value: item))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownvalueRecallMode = value!;
                  });
                },
                value: dropdownvalueRecallMode,
                autofocus: false,
              ),
            ),
            const SizedBox(height: 32,)
          ],
        ),
      ),
    );
  }
}

class Intro_text extends StatelessWidget {
  const   Intro_text({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Remember',
                style: GoogleFonts.livvic(
                    fontSize: 32, fontWeight: FontWeight.w600)),
            Text(
              'Words',
              style: GoogleFonts.livvic(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45),
            )
          ],
        ),
      ),
    );
  }
}
