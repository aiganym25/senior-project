import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:senior_project/domain/session_data_providers.dart';
import '../../models/experiment.dart';
import 'package:senior_project/repo/api_client.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ExperimentParametersMV extends ChangeNotifier {
  final titleExperimentController = TextEditingController();
  final descriptionController = TextEditingController();
  final numberOfWordsController = TextEditingController();
  final wordShowTimeController = TextEditingController();
  final betweenWordTimeController = TextEditingController();
  final wordsController = TextEditingController();

  final lowerFreqController = TextEditingController();
  final upperFreqController = TextEditingController();
  final lengthController = TextEditingController();

  int selectedOption = 1;

  String isJoinableExperiment = 'True';

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<String> words = [];

  final _apiClient = ApiClient();

  final client = HttpClient();
  bool isSendRequest = false;
  // Map<String, dynamic> results = {};
  List<dynamic> results = [];

  Future<void> getListOfParticipants(int id) async {
    final response = await _apiClient.getListOfParticipants(id);
    if (response.statusCode == 200) {
      results = jsonDecode(response.body)['data'];
      notifyListeners();
    }
  }

  Future<int> createExperiment(BuildContext context) async {
    final title = titleExperimentController.text;
    final description = descriptionController.text;

    var betweenWordTime = 0.0;
    var wordShowTime = 0.0;
    if (betweenWordTimeController.text.isNotEmpty) {
      betweenWordTime = double.parse(betweenWordTimeController.text);
    }
    if (wordShowTimeController.text.isNotEmpty) {
      wordShowTime = double.parse(wordShowTimeController.text);
    }
    final inputWords = wordsController.text;
    if (inputWords.isNotEmpty) {
      words = inputWords.split(', ').map((word) => word.trim()).toList();
      notifyListeners();
    }
    if (title.isEmpty ||
        description.isEmpty ||
        betweenWordTimeController.text.isEmpty ||
        wordShowTimeController.text.isEmpty) {
      _errorMessage = 'Please, complete all required fields';
      notifyListeners();
      // return 0;
    }

    _errorMessage = null;
    notifyListeners();

    var requestBodyEnterWords = NewExperiment(
        experimentName: title,
        words: words,
        description: description,
        betweenWordTime: betweenWordTime,
        wordTime: wordShowTime,
        isJoinable: isJoinableExperiment);

    var requestBodyWithFreqLen = {
      "experimentName": title,
      "description": description,
      "wordTime": wordShowTime,
      "betweenWordTime": betweenWordTime,
      "numberOfWords": numberOfWordsController.text,
      "frequencyRange": [lowerFreqController.text, upperFreqController.text],
      "lengthOfWords": lengthController.text,
      "isJoinable": true
    };

    var requestBodyRandomWords = {
      "experimentName": title,
      "description": description,
      "wordTime": wordShowTime,
      "betweenWordTime": betweenWordTime,
      "numberOfWords": numberOfWordsController.text,
      "isJoinable": true
    };

    try {
      var response = selectedOption == 1
          ? await _apiClient.createExperimentByFreqLen(requestBodyWithFreqLen)
          : selectedOption == 2
              ? await _apiClient
                  .createExperimentWithRandomWords(requestBodyRandomWords)
              : await _apiClient.createExperimentWithEnterWords(
                  requestBodyEnterWords.toJson());
      // if (_errorMessage != null) {
      //   notifyListeners();

      // }

      if (response.statusCode == 200) {
        // Clear all text editing controllers
        titleExperimentController.clear();
        descriptionController.clear();
        numberOfWordsController.clear();
        wordShowTimeController.clear();
        betweenWordTimeController.clear();
        wordsController.clear();
        lowerFreqController.clear();
        upperFreqController.clear();
        lengthController.clear();

        // Reset other properties
        _errorMessage = null;
        notifyListeners();

        Navigator.pop(context);
      }

      return response.statusCode;
    } catch (er) {
      _errorMessage = 'Experiment creation failed, please try again!';
      throw Exception(er);
    }

    // Navigator.of(context).popUntil((route) => route.);
    // Navigator.of(context).push(
    //   MaterialPageRoute<void>(
    //     builder: (BuildContext context) => const MainPage(),
    //   ),
    // );
    // return 0;
  }

  Future<int> deleteExperimentById(int id) async {
    final response = await _apiClient.deleteExperimentById(id);
    // print(response.statusCode);

    return response.statusCode;
  }

  Future<http.Response> getCreatedExpResultsById(int id) async {
    var token = await SessionDataProvider().getSessionId();
    return http.get(
        Uri.parse(
            'https://my-spring-app-sp.herokuapp.com/api/v2/experiment/myCreatedExperiments/id/$id'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        });
  }

  Future<void> sendRequest(int id) async {
    final responseStatusCode = await _apiClient.sendRequest(id);
    if (responseStatusCode == 200) {
      isSendRequest = true;
      notifyListeners();
    }
  }

  Future<http.Response> getMyTakenExperiemnts() async {
    var token = await SessionDataProvider().getSessionId();
    return http.get(
        Uri.parse(
            'https://my-spring-app-sp.herokuapp.com/api/v2/experiment/UserTakenExperiments'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        });
  }

  Future<dynamic> viewResultsTakenExperiments(int id) async {
    var token = await SessionDataProvider().getSessionId();
    try {
      final response = await http.get(
          Uri.parse(
              'https://my-spring-app-sp.herokuapp.com/api/v2/particpation/myTakenParticipation/$id'),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token'
          });
      return (jsonDecode(response.body));
    } catch (er) {
      print(er);
    }
  }

  Future<http.Response> getMyCreatedexperiments() async {
    var token = await SessionDataProvider().getSessionId();
    return http.get(
        Uri.parse(
            'https://my-spring-app-sp.herokuapp.com/api/v2/experiment/myCreatedExperiments'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        });
  }

  Future<http.Response> getAvailableExperiments() async {
    var token = await SessionDataProvider().getSessionId();
    return http.get(
        Uri.parse(
            'https://my-spring-app-sp.herokuapp.com/api/v2/experiment/getAllExperiments'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        });
  }
}
