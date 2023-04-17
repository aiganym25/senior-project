import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:senior_project/domain/session_data_providers.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final client = HttpClient();
  static const _host = 'https://my-spring-app-sp.herokuapp.com';

  Future<dynamic> deleteExperimentById(int id) async {
    var token = await SessionDataProvider().getSessionId();
    final url = _makeUri('/api/v2/experiment/myCreatedExperiments/$id');

    try {
      final response = await http.delete(url, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      });
      // print(response.body);
      return response;
    } catch (er) {
      print(er);
    }
  }

  Future<dynamic> getListOfParticipants(int id) async {
    var token = await SessionDataProvider().getSessionId();
    final url = _makeUri('/api/v2/particpation/myCreatedExperiments/taken/$id');
    try {
      final response = await http.get(url, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      });
      return response;
    } catch (er) {
      print(er);
    }
  }

  Future<dynamic> getMyUserInfo(String token) async {
    final url = _makeUri('/api/v2/user/myUserInfo');

    var response = await http.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    });
    return jsonDecode(response.body);
  }

  Future<dynamic> getRequestStatus() async {
    final url = _makeUri('/api/v2/particpation/myRequests');
    var token = await SessionDataProvider().getSessionId();
    try {
      var response = await http.get(url, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      });
      return response.body;
    } catch (er) {
      print(er);
    }
  }

  Future<dynamic> sendRequest(int id) async {
    final url = _makeUri('/api/v2/particpation/join/$id');
    var token = await SessionDataProvider().getSessionId();
    try {
      var response = await http.post(url, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      });
      return response;
    } catch (er) {
      print(er);
    }
  }

  Future<dynamic> getExperimentsByEmail(String email) async {
    final url = _makeUri('/experiments-byEmail/${email}');
    // final parameters = <String, dynamic>{"email": email};
    var token = await SessionDataProvider().getSessionId();

    final request = await client.getUrl(url);
    request.headers.add('Authorization', 'Bearer $token');
    final response = await request.close();

    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);
  }

  Future<Response> createExperimentWithEnterWords(
      Map<String, dynamic> object) async {
    final url = _makeUri('/api/v2/experiment/postExperiment');
    var token = await SessionDataProvider().getSessionId();
    var body = jsonEncode(object);
    try {
      var response = await http.post(url, body: body, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      });

      return response;
    } catch (er) {
      throw Exception(er);
    }
  }

  Future<Response> createExperimentByFreqLen(
      Map<String, dynamic> object) async {
    final url = _makeUri('/api/v2/experiment/postExperimentWithParam');
    var token = await SessionDataProvider().getSessionId();
    var body = jsonEncode(object);
    try {
      var response = await http.post(url, body: body, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      });
      return response;
    } catch (er) {
      throw Exception(er);
    }
  }

  Future<dynamic> createExperimentWithRandomWords(
      Map<String, dynamic> object) async {
    final url = _makeUri('/api/v2/experiment/postRandomV2');
    var token = await SessionDataProvider().getSessionId();
    var body = jsonEncode(object);
    try {
      var response = await http.post(url, body: body, headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      });
      return response;
    } catch (er) {
      print(er);
    }
  }

  Future<dynamic> getMyCreatedExperiments() async {
    final url = _makeUri('/my-created-experiments');
    var token = await SessionDataProvider().getSessionId();

    var response = await http.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    });
    return response;
  }

  Future<String> login(
      {required String email, required String password}) async {
    final token = await _loginUser(email, password);
    return token;
  }

  Future<String> signUp(
      {required String email,
      required String firstName,
      required String lastName,
      required String password,
      required String age,
      required String gender,
      required String degree}) async {
    final token = await _signUp(
        email, firstName, lastName, password, age, gender, degree);
    return token;
  }

  Future<String> _loginUser(String email, String password) async {
    final url = _makeUri('/auth/authenticate');

    final parameters = <String, dynamic>{"email": email, "password": password};

    final request = await client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));

    final response = await request.close();

    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);

    final token = json["token"] as String;

    return token;
  }

  Future<String> _signUp(String email, String firstName, String lastName,
      String password, String age, String gender, String degree) async {
    final url = _makeUri('/auth/register');
    final parameters = <String, dynamic>{
      "userEmail": email,
      "firstName": firstName,
      "lastName": lastName,
      "password": password,
      "age": age,
      "gender": gender,
      "degree": degree
    };

    final request = await client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));

    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);
    final token = json["token"] as String;
    return token;
  }

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');

    if (parameters != null) {
      print(uri);
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<String> getToken() async {
    final url = _makeUri('/demo-controller');
    final request = await client.getUrl(url);

    var token = await SessionDataProvider().getSessionId();
    // Map<String, String> headers = {
    //   "Accept": "application/json",
    //   "Content-Type": "application/json",
    //   "Authorization": "Bearer $token"
    // };

    request.headers.add('Content-Type', 'application/json; charset=UTF-8');
    request.headers.add('Accept', 'application/json');
    request.headers.add('Authorization', 'Bearer $token');

    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);
    return json["token"];
  }
}
