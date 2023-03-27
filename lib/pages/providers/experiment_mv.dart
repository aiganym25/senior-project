import 'package:flutter/material.dart';

class ExperimentParametersMV extends ChangeNotifier {
  int numberOfWords = 0;
  double wordShowTime = 0;
  int upperLimit = 0;
  int lowerLimit = 0;
  int lengthOfWords = 3;
  String title = '';
  // int experimentId = 1;
  bool isEmpty = true;
  int _id = 1;

  int get id => _id;

  void setId(int newId) {
    _id = newId;
    notifyListeners();
  }

  void setTitle(val) {
    title = val;
    notifyListeners();
  }

  void setNumberOfWords(val) {
    numberOfWords = val;
    notifyListeners();
  }

  void setLengthOfWords(val) {
    lengthOfWords = val;
    notifyListeners();
  }

  void setTimeShowTime(val) {
    wordShowTime = val;
    notifyListeners();
  }

  void setRangeOfWords(upper, lower) {
    upperLimit = upper;
    lowerLimit = lower;
    // print(upperLimit);
    notifyListeners();
  }

  List<int> getRangeOfWords() {
    return [lowerLimit, upperLimit];
  }

  // void setExperimentId(val) {
  //   experimentId = val;
  //   notifyListeners();
  // }
}
