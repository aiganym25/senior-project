import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../domain/session_data_providers.dart';
import '../../repo/api_client.dart';

class RequestedExperimentsMV extends ChangeNotifier {
  bool isShow = false;
  bool isAccepted = false;

  final _apiClient = ApiClient();

  Future<void> sendResults(List<String> words, id) async {
    Map<String, dynamic> map = {'participantResponseList': words};
    var token = await SessionDataProvider().getSessionId();
    final url =
        'https://my-spring-app-sp.herokuapp.com/api/v2/particpation/participate/$id';

    final body = jsonEncode(map);

    try {
      var response = await http.post(Uri.parse(url), body: body, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      });
      print('0');
      print(response.statusCode);
      print('printed');
    } catch (er) {
      print(er);
    }
  }

  Future<http.Response> getAcceptedExperiment(int id) async {
    print('error');
    var token = await SessionDataProvider().getSessionId();
    final url =
        'https://my-spring-app-sp.herokuapp.com/api/v2/particpation/participate/$id';

    return http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    });
  }

  Future<http.Response> getRequestType() async {
    var token = await SessionDataProvider().getSessionId();
    const url =
        'https://my-spring-app-sp.herokuapp.com/api/v2/particpation/myRequests';
    return http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    });
  }

  Future<void> sendAcceptRequest(int id) async {
    var token = await SessionDataProvider().getSessionId();
    final url =
        'https://my-spring-app-sp.herokuapp.com/api/v2/particpation/myCreatedExperiments/pending-requests/accept-request/$id';
    try {
      var response = await http.post(Uri.parse(url), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      });
      isAccepted = true;
      notifyListeners();
      print(response.statusCode);
    } catch (er) {
      print(er);
    }
  }

  Future<void> sendRejectRequest(int id) async {
    var token = await SessionDataProvider().getSessionId();
    final url =
        'https://my-spring-app-sp.herokuapp.com/api/v2/particpation/myCreatedExperiments/pending-requests/reject-request/$id';
    try {
      var response = await http.post(Uri.parse(url), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      });
      print(response.statusCode);
      isAccepted = true;
      notifyListeners();
    } catch (er) {
      print(er);
    }
  }

  Future<http.Response> getMyRequests(int id) async {
    var token = await SessionDataProvider().getSessionId();
    final url =
        'https://my-spring-app-sp.herokuapp.com/api/v2/particpation/myCreatedExperiments/pending-requests/$id';
    return http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    });
  }
}
