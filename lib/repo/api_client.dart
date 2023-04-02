import 'dart:convert';
import 'dart:io';

class ApiClient {

  final _client = HttpClient();
  static const _host = 'https://demo409.herokuapp.com';

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
    final token =
        await _signUp(email, firstName, lastName, password, age, gender, degree);
    return token;
  }

  Future<String> _loginUser(String email, String password) async {
    final url = _makeUri('/auth/authenticate');

    final parameters = <String, dynamic>{
      "email": email,
      "password": password
    };

    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));

    final response = await request.close();

    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);

    final token = json["token"] as String;
    print(token);
    return token;
  }

  Future<String> _signUp( email, firstName, lastName, password, age, gender, degree) async {
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

    print(parameters);
    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));

    final response = await request.close();
    print(response);

    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);

    final token = json["token"] as String;
    print(token);
    return token;
  }



  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  // Future<String> _makeToken() async {
  //   final url = _makeUri('', {'api_key': _apiKey});
  //   final request = await _client.getUrl(url); // send request
  //   final response = await request.close(); // get response
  //   final json = await response
  //       .transform(utf8.decoder)
  //       .toList()
  //       .then((value) => value.join())
  //       .then((v) => jsonDecode(v) as Map<String, dynamic>);

  //   final token = json["request_token"] as String;
  //   return token;
  // }

  Future<String> _getToken(String token) async {
    final url = _makeUri('demo-controller');
    final request = await _client.getUrl(url); // send request
    // request.add();
    final response = await request.close(); // get response
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);

    final token = json["token"] as String;
    return token;
  }

  // Future<String> _validateUser(
  //     String email, String password, String requestToken) async {
  //   final url = Uri.parse('');
  //   final parameters = <String, dynamic>{
  //     'email': email,
  //     'password': password,
  //     'request_token': requestToken
  //   };

  //   final request = await _client.postUrl(url);
  //   request.headers.contentType = ContentType.json;
  //   // body of the request
  //   request.write(jsonEncode(parameters));
  //   final response = await request.close();
  //   final json = await response
  //       .transform(utf8.decoder)
  //       .toList()
  //       .then((value) => value.join())
  //       .then((v) => jsonDecode(v) as Map<String, dynamic>);

  //   final token = json["request_token"] as String;
  //   return token;
  // }

  Future<String> _makeSession(String requestToken) async {
    final url = Uri.parse('');
    final parameters = <String, dynamic>{'request_token': requestToken};

    final request = await _client.postUrl(url);
    request.headers.contentType = ContentType.json;
    // body of the request
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);

    final sessionId = json["session_id"] as String;
    return sessionId;
  }
}
