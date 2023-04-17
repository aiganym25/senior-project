import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../domain/session_data_providers.dart';

class UserMV extends ChangeNotifier {
  static const _host = 'https://my-spring-app-sp.herokuapp.com';

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');

    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<dynamic> logOut() async {
    var token = await SessionDataProvider().getSessionId();
    final url = _makeUri('/auth/logout');
    try {
      final response = await http.get(url, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      });
      return jsonDecode(response.body);
    } catch (er) {
      print(er);
    }
  }

  Future<http.Response> getMyUserInfo() async {
    var token = await SessionDataProvider().getSessionId();
    final url = _makeUri('/api/v2/user/myUserInfo');
    return http.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    });
  }
}
