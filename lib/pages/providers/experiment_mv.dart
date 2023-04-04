import 'package:flutter/material.dart';
import 'package:senior_project/domain/session_data_providers.dart';
import 'package:senior_project/pages/profile/profile.dart';
import '../../models/experiment.dart';
import 'package:senior_project/repo/api_client.dart';
import 'package:http/http.dart' as http;

class ExperimentParametersMV extends ChangeNotifier {
  final titleExperimentController = TextEditingController();
  final descriptionController = TextEditingController();
  final numberOfWordsController = TextEditingController();
  final wordShowTimeController = TextEditingController();
  final betweenWordTimeController = TextEditingController();
  final wordsController = TextEditingController();
  String isJoinableExperiment = 'True';

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<String> words = [];

  final _apiClient = ApiClient();

  Future<http.Response> getMyCreatedexperiments() async {
    var token = await SessionDataProvider().getSessionId();
    _apiClient.getMyCreatedExperiments();
    return http.get(
        Uri.parse('https://my-spring-app-sp.herokuapp.com/my-created-experiments'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        });
  }

  Future<void> createExperiment(BuildContext context) async {
    final title = titleExperimentController.text;
    final description = descriptionController.text;
    print('in create function');

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
        words.isEmpty ||
        description.isEmpty ||
        betweenWordTimeController.text.isEmpty ||
        wordShowTimeController.text.isEmpty) {
      _errorMessage = 'Please, complete all required fields';
      notifyListeners();
      return;
    }

    _errorMessage = null;
    notifyListeners();

    var newExperiment = NewExperiment(
        experimentName: title,
        words: words,
        description: description,
        experimentType: '1',
        betweenWordTime: betweenWordTime,
        wordTime: wordShowTime,
        isJoinable: isJoinableExperiment);
    var activityData = newExperiment.toJson();

    try {
      var response = await _apiClient.createExperiment(activityData);
    } catch (er) {
      _errorMessage = 'Experiment creation failed, please try again!';
      print(er);
    }
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }
    // Navigator.of(context).popUntil((route) => route.);
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const MyProfile(),
      ),
    );
  }
}
