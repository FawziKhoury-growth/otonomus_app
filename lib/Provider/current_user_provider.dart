import 'package:flutter/material.dart';
import 'package:task7/models/UserModel.dart';
import 'package:task7/service/firebase_helper.dart';

class CurrentUser with ChangeNotifier{
  UserModel? _user;
  
  UserModel? get user => _user;
  
  Future<void> fetchUser() async{
    firebase_helper firebaseHelper = firebase_helper();
    _user=await firebaseHelper.checkUser();
    notifyListeners();
  }

}