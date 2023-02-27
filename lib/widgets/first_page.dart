import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:senior_project/widgets/login.dart';
import 'package:senior_project/widgets/sign_up.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(176, 167, 249, 1),
            Color.fromRGBO(167, 174, 249, 1),
            Color.fromRGBO(151, 225, 212, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.help, color: Colors.white, size: 30)),
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  'assets/icons/additional_info.svg',
                  color: Colors.white,
                ),
                SvgPicture.asset(
                  'assets/first_page_icon.svg',
                  height: 250,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: Text(
                    'Word memorizing app ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const SignUp(),
                            ),
                          );
                        },
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(131, 89, 227, 1),
                          ),
                          child: Stack(
                            children: const [
                              Align(
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
                                child: Text(
                                  'Sign up with Email',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const Login(),
                            ),
                          );
                        },
                        child: Container(
                          height: 40,
                          margin: const EdgeInsets.symmetric(vertical: 50),
                          padding: const EdgeInsets.symmetric(
                            vertical: 11,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(131, 89, 227, 1),
                          ),
                          child: Stack(
                            children: const [
                              Align(
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
                                child: Text('Login with Email',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
