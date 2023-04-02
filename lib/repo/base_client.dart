import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:senior_project/models/get_experiment.dart';

const String baseURL = 'https://my-spring-app-sp.herokuapp.com/api/v1/';

class BaseClient {
  var client = http.Client();

  Future<dynamic> postExperiment(
      String url, Map<String, dynamic> object) async {
    var body = jsonEncode(object);
    // print(body);
    try {
      var response = await http.post(Uri.parse(url), body: body, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      });
      return response;
      //  print(response.body);
      //  print(response.statusCode);
    } catch (er) {
      print(er);
    }
  }

  // Future<dynamic> getExperiments(String url) async {
  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     return GetExperiment.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load expriments');
  //   }
  // }

  // Future<Response> registerUser(String url) async{
  //   Response response = await get(
  //     url, 
  //     cont
  //   )

  // }

  // Future<Response> login() async {
  //   }
  //   Future<Response> getUserProfileData() async {
  //       //GET USER PROFILE DATA
  //   }

  //   Future<Response> logout() async {
  //       //IMPLEMENT USER LOGOUT
  //    }
}
