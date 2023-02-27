import 'package:flutter/material.dart';
import 'package:senior_project/widgets/already_have_acc.dart';
import 'package:senior_project/widgets/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              height: 400,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Sign up ',
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 32),
                    NameTextField(),
                    const SizedBox(
                      height: 16,
                    ),
                    EmailTextField(),
                    const SizedBox(
                      height: 16,
                    ),
                    PasswordTextField(),
                    const SizedBox(
                      height: 32,
                    ),
                    const CreateAccButton(),
                    const SizedBox(
                      height: 16,
                    ),
                    const Divider(height: 10, color: Colors.black45),
                    const SizedBox(
                      height: 16,
                    ),
                    AlreadyHaveAnAccountCheck(
                      login: false,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Login();
                            },
                          ),
                        );
                      },
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

  Container EmailTextField() {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        // border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        controller: _controllerEmail,
        onChanged: (value) {
          // words[index] = _controllers![index].text;
          setState(() {});
        },
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
            fontWeight: FontWeight.w400, color: Colors.black, fontSize: 18),
        decoration: const InputDecoration(
          hintText: 'Email',
          filled: true,
          contentPadding: EdgeInsets.only(left: 15, bottom: 15),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Container NameTextField() {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        // border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        keyboardType: TextInputType.name,
        controller: _controllerName,
        onChanged: (value) {
          // words[index] = _controllers![index].text;
          setState(() {});
        },
        style: const TextStyle(
            fontWeight: FontWeight.w400, color: Colors.black, fontSize: 18),
        decoration: const InputDecoration(
          hintText: 'Name',
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
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromRGBO(131, 89, 227, 1),
      ),
      child: const Center(
        child: Text('Create account',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18)),
      ),
    );
  }
}
