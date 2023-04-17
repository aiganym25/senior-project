import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../domain/session_data_providers.dart';
import '../../repo/api_client.dart';

class RequestedExperimentsMV extends ChangeNotifier {
  final _apiClient = ApiClient();

  Future<dynamic> sendResults(List<String> words, id, BuildContext context) async {
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
      print('rpint');
      if (response.statusCode == 200) {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
      }
      return response;
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
