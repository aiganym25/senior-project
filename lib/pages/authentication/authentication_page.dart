import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:senior_project/pages/authentication/auth_model.dart';
import 'package:senior_project/widgets/buttons/btn_with_icons.dart';
import 'package:senior_project/pages/authentication/login.dart';
import 'package:senior_project/pages/authentication/sign_up.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
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
              children: [
                GestureDetector(
                  onTap: () {
                    showAdditionalInfo(context);
                  },
                  child: const Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.help, color: Colors.white, size: 30)),
                ),
                const SizedBox(
                  height: 32,
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
                                builder: (BuildContext context) =>
                                    const SignUp(),
                              ),
                            );
                          },
                          child: ButtonWithIcons(txt: 'Sign up with Email')),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => AuthProvider(
                                  model: AuthModel(),
                                  child: const Login(),
                                ),
                              ),
                            );
                          },
                          child: ButtonWithIcons(
                            txt: 'Login with Email',
                          )),
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

  Future<void> showAdditionalInfo(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('Additional information about the app',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
