import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task7/models/UserModel.dart';
import 'package:task7/navigator/route_navigator.dart';
import 'package:task7/service/firebase_helper.dart';

import '../presentation/shared_widgets/custom_error_widget.dart';

class CurrentUserProvider with ChangeNotifier{
  UserModel? _user;
  String? errorMessage;
  UserModel? get user => _user;


  bool _isLoading =false;
  bool get isloading => _isLoading;
  
  Future<void> fetchUser() async{


    FirebaseHelper firebaseHelper = FirebaseHelper();
    _user=await firebaseHelper.checkUser();
    notifyListeners();
  }



  void login(TextEditingController controllerEmail,TextEditingController controllerPassword) async {
    _isLoading=true;
    notifyListeners();
    String email = controllerEmail.text;
    String password = controllerPassword.text;
    FirebaseHelper firebaseHelper = FirebaseHelper();

    try {
      
      await firebaseHelper.signInWithEmailPassword(email, password);
      await fetchUser();
      _isLoading=false;
    notifyListeners();
    RouteNavigator.goToFirst();
      
    } catch (e) {
     _isLoading=false;
      if(e is FirebaseAuthException){
        errorMessage=e.message!;
        
      }
       notifyListeners();
       await Future.delayed(const Duration(seconds: 4), (){});
        errorMessage=null;
        notifyListeners();
    }
  }

   void signUp(TextEditingController controllerFirstName,TextEditingController controllerLastName, TextEditingController controllerEmail,TextEditingController controllerPassword) async {
    _isLoading=true;
    notifyListeners();
    String firstName = controllerFirstName.text;
    String lastName = controllerLastName.text;
    String email = controllerEmail.text;
    String password = controllerPassword.text;
    FirebaseHelper firebaseHelper = FirebaseHelper();

    try {
      errorMessage=null;
      await firebaseHelper.signUpWithEmailPassword(
          firstName, lastName, email, password);
      await fetchUser();
      _isLoading=false;
      notifyListeners();
      RouteNavigator.goToFirst();
    } catch (e) {
      _isLoading=false;
      notifyListeners();
      if (e is FirebaseAuthException) {
        errorMessage=e.message!;
        notifyListeners();
        
      }
    }

  }

}