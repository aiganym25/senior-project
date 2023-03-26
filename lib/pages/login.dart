import 'package:flutter/material.dart';
import 'package:senior_project/pages/main_page.dart';
import 'package:senior_project/widgets/buttons/button.dart';
import 'package:senior_project/widgets/input_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(158, 225, 236, 1),
            Color.fromRGBO(229, 167, 224, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              width: double.infinity,
              height: 300,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Login ',
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 32),
                    InputWidget(controller: _controllerEmail, hintName: 'Email', isEmail: true),
                    const SizedBox(
                      height: 16,
                    ),
                    InputWidget(controller: _controllerPassword, hintName: 'Password', isPassword: true),
                    const SizedBox(
                      height: 32,
                    ),
                    const CreateAccButton(),
                    const SizedBox(
                      height: 16,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Container PasswordTextField() {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        controller: _controllerPassword,
        textInputAction: TextInputAction.done,
        obscureText: true,
        style: const TextStyle(
            fontWeight: FontWeight.w400, color: Colors.black, fontSize: 18),
        decoration: const InputDecoration(
          hintText: 'Password',
          filled: true,
          contentPadding: EdgeInsets.only(left: 15, bottom: 15),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  
}

class CreateAccButton extends StatelessWidget {
  const CreateAccButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const MainPage(),
          ),
        );
      },
      child: ButtonWidget(txt: 'Log in'),
    );
  }
}
