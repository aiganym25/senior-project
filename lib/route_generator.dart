import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:senior_project/pages/authentication/auth_model.dart';
import 'package:senior_project/pages/authentication/authentication_page.dart';
import 'package:senior_project/pages/authentication/login/login.dart';
import 'package:senior_project/pages/authentication/sign_up/sign_up.dart';
import 'package:senior_project/pages/feed-home/experiment/animated_cards.dart';
import 'package:senior_project/pages/feed-home/experiment/fill_in_page.dart';
import 'package:senior_project/pages/main_page.dart';
import 'package:senior_project/pages/profile/created_experiment.dart';
import 'package:senior_project/pages/providers/experiment_mv.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => AuthProvider(
              model: AuthModel(), child: const AuthenticationPage()),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => AuthProvider(
            model: AuthModel(),
            child: const Login(),
          ),
        );
      case '/sign-up':
        return MaterialPageRoute(
          builder: (_) => AuthProvider(
            model: AuthModel(),
            child: const SignUp(),
          ),
        );
      case '/main-page':
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
        );

      

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
