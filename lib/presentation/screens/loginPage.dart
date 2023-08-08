import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task7/Provider/current_user_provider.dart';
import 'package:task7/navigator/route_navigator.dart';
import 'package:task7/presentation/screens/signUpPage.dart';
import 'package:task7/presentation/shared_widgets/errorMessage.dart';
import 'package:task7/presentation/shared_widgets/loading_indicator.dart';
import 'package:task7/service/firebase_helper.dart';

import '../shared_widgets/Button.dart';
import '../shared_widgets/custom_text_fiel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  firebase_helper firebaseHelper = firebase_helper();


  void _handleSignIn() async {
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;
    String error="";
    ErrorMessage errorMessage =ErrorMessage();

    try {
      LoadingIndicatorOverlay.show(context);
      await firebaseHelper.signInWithEmailPassword(email, password);
      await Provider.of<CurrentUser>(context, listen: false).fetchUser();
      LoadingIndicatorOverlay.hide();
      Navigator.popUntil(context, (route) => route.isFirst);
    } catch (e) {
      LoadingIndicatorOverlay.hide();
      if(e is FirebaseAuthException){
        errorMessage.showErrorSnackbar(context, e.message!);
      }
    }
  
    _controllerEmail.clear();
    _controllerPassword.clear();
    
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => {Navigator.pop(context)},
                  child: Image.asset(
                    'assets/icon/xIcon.png',
                    width: 15.5,
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/logoImage.png',
              width: 122,
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child: Column(
                  children: [
                    Text(
              'You need to login to complete the booking process',
              style: TextStyle(
                      fontFamily: "MontserratRegular",
                      fontSize: 12,
                      color: Color(0xFF323E48)),
            ),
            
                  ],
                )),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    controller: _controllerEmail,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.0),
                  CustomTextField(
                    controller: _controllerPassword,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  SizedBox(height: 32.0),
                  CustomButton(
                      title: "Log In",
                      color: Colors.blue,
                      TextColor: Colors.white,
                      radius: 10,
                      onPressed: () => {_handleSignIn()}),
                ],
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don\'t have an account?",
                    style: TextStyle(
                        fontFamily: "MontserratSemiBold", fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      RouteNavigator.goTo("signup");
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: "MontserratSemiBold",
                          fontSize: 14),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    ));
    ;
  }
}
