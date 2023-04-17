import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:senior_project/domain/session_data_providers.dart';
import 'package:senior_project/models/get_experiment.dart';

const String baseURL = 'https://my-spring-app-sp.herokuapp.com/api/v1/';

class BaseClient {
  var client = http.Client();

  Future<dynamic> postExperiment(
      String url, Map<String, dynamic> object) async {
    var body = jsonEncode(object);
    try {
      var response = await http.post(Uri.parse(url), body: body, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      });
      return response;
 
    } catch (er) {
      print(er);
    }
  }

  Future<dynamic> getExperimentsByEmail(String email) async {
    
    var token = await SessionDataProvider().getSessionId();
    var url = 'https://demo409.herokuapp.com/experiments-byEmail';

    try {
      var response = await http.get(Uri.parse(url), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      });

      return response.body;

    } catch (er) {
      print(er);
    }
  }

 
}
