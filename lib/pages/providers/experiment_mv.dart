import 'package:flutter/material.dart';
import 'package:senior_project/domain/data_providers/session_data_providers.dart';
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

  String _errorMessage = 'sdvsdv';
  String get errorMessage => _errorMessage;

  List<String> words = [];

  final _apiClient = ApiClient();

  Future<http.Response> getMyCreatedexperiments() async {
    var token = await SessionDataProvider().getSessionId();
    _apiClient.getMyCreatedExperiments();
    return http.get(
        Uri.parse('https://demo409.herokuapp.com/my-created-experiments'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        });
  }

  void createExperiment(BuildContext context) async {
    final title = titleExperimentController.text;
    final description = descriptionController.text;
    double betweenWordTime = double.parse(betweenWordTimeController.text);
    double wordShowTime = double.parse(wordShowTimeController.text);

    if (title.isEmpty ||
        words.isEmpty ||
        description.isEmpty ||
        betweenWordTimeController.text.isEmpty ||
        wordShowTimeController.text.isEmpty) {
      _errorMessage = 'Please, complete all required fields';
      print(_errorMessage);
      notifyListeners();
      return;
    }
    print('dfgdf');
    print(_errorMessage);
    _errorMessage = 'Please, complete all required fields';
    notifyListeners();

    final inputWords = wordsController.text;
    if (inputWords.isNotEmpty) {
      words = inputWords.split(', ').map((word) => word.trim()).toList();
      // print(words);
      notifyListeners();
    }

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
      print(response.body);
    } catch (er) {
      _errorMessage = 'Experiment creation failed, please try again!';
    }
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }
    // _errorMessage = null;
    // notifyListeners();

    Navigator.of(context).pop();
  }
}
