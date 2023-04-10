import 'package:flutter/material.dart';
import 'package:senior_project/domain/session_data_providers.dart';

class UserMV extends ChangeNotifier {
  String? userName;
  Future<void> getUserinfo() async {
    userName = await SessionDataProvider().getUserName();
    notifyListeners();
  }
}
