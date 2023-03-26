import 'package:flutter/material.dart';

class RequestedExperimentsMV extends ChangeNotifier{
  String status = 'accepted';
  String requestStatus = 'null';

  void getStatus (String st) {
    status = st; 
    notifyListeners();
  } 

  void changeRequestStatus (){
    requestStatus = 'in progress';
    notifyListeners();
  }
}