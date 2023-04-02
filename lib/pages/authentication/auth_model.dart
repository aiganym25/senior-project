import 'package:flutter/material.dart';
import 'package:senior_project/domain/data_providers/session_data_providers.dart';
import 'package:senior_project/pages/main_page.dart';
import 'package:senior_project/repo/api_client.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final degreeController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get isAuthProgress => _isAuthProgress;
  bool get canStartAuth => !_isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;
    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Fill the email and password';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();

    String? token;
    try {
      token = await _apiClient.login(email: login, password: password);
    } catch (er) {
      _errorMessage = 'Wrong email or password';
    }

    _isAuthProgress = false;
    if (_errorMessage != null || token == null) {
      notifyListeners();
      return;
    }
    if (token == null) {
      _errorMessage = 'Try again';
      notifyListeners();
      return;
    }

    await _sessionDataProvider.setSessionId(token);
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const MainPage(),
      ),
    );
  }

  Future<void> register(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final age = ageController.text;
    final gender = genderController.text;
    final degree = degreeController.text;

    // print(login);

    if (login.isEmpty ||
        password.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        age.isEmpty ||
        gender.isEmpty ||
        degree.isEmpty) {
      _errorMessage = 'Fill all the fields';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? token;
    try {
      token = await _apiClient.signUp(
          email: login,
          password: password,
          age: age,
          degree: degree,
          firstName: firstName,
          gender: gender,
          lastName: lastName);
    } catch (er) {
      _errorMessage = 'Registration failed, try again';
    }

    _isAuthProgress = false;
    if (_errorMessage != null || token == null) {
      notifyListeners();
      return;
    }
    if (token == null) {
      _errorMessage = 'Registration failed, try again';
      notifyListeners();
      return;
    }

    await _sessionDataProvider.setSessionId(token);
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const MainPage(),
      ),
    );
  }
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;

  const AuthProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static AuthProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  static AuthProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }
}
