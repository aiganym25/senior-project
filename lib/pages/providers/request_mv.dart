import 'package:flutter/material.dart';

class RequestedExperimentsMV extends ChangeNotifier{
  String status = 'accepted';
  String requestStatus = 'null';
  bool isShow = false; 
  bool isAccepted = false;

  void getStatus (String st) {
    status = st; 
    notifyListeners();
  } 

  void changeIsAccepted (){
    isAccepted = true; 
    notifyListeners();
  }

  void changeRequestStatus (){
    requestStatus = 'in progress';
    notifyListeners();
  }

  void changeShowStatus (){
    isShow = true; 
    notifyListeners();
  }


}