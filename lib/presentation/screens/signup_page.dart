import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task7/Provider/current_user_provider.dart';
import 'package:task7/navigator/route_navigator.dart';
import 'package:task7/presentation/shared_widgets/custom_button_widget.dart';
import 'package:task7/presentation/shared_widgets/custom_error_widget.dart';
import 'package:task7/presentation/shared_widgets/loading_widget.dart';

import '../../service/firebase_helper.dart';
import '../shared_widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  // firebase_helper firebaseHelper = firebase_helper();

  // void _handleSignUp() async {
  //   String firstName = _controllerFirstName.text;
  //   String lastName = _controllerLastName.text;
  //   String email = _controllerEmail.text;
  //   String password = _controllerPassword.text;

  //   try {
  //     LoadingIndicatorOverlay.show(context);
  //     await firebaseHelper.signUpWithEmailPassword(
  //         firstName, lastName, email, password, context);
  //     await Provider.of<CurrentUserProvider>(context, listen: false).fetchUser();
  //     LoadingIndicatorOverlay.hide();
  //     Navigator.popUntil(context, (route) => route.isFirst);
  //   } catch (e) {
  //     LoadingIndicatorOverlay.hide();
  //     if (e is FirebaseAuthException) {
  //       ErrorMessage().showErrorSnackbar(context, e.message!);
  //     }
  //   }

  
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUserProvider>(
      builder: (context, currentUserProvider,_) {
        return Scaffold(
            body: Container(
          decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontFamily: "MontserratMedium",
                          fontSize: 16,
                          color: Color(0xFF323E48)),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextField(
                              controller: _controllerFirstName, hintText: 'First Name'),
                          SizedBox(height: 16.0),
                          CustomTextField(
                            controller: _controllerLastName,
                            hintText: 'Last Name',
                          ),
                          SizedBox(height: 16.0),
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
                          CustomButtonWidget(
                              title: "NEXT",
                              color: Colors.blue,
                              TextColor: Colors.white,
                              radius: 10,
                              onPressed: ()async => {currentUserProvider.signUp(_controllerFirstName, _controllerLastName, _controllerEmail, _controllerPassword)})
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              currentUserProvider.isloading ? CustomLoadingWidget() : SizedBox.shrink(),
              currentUserProvider.errorMessage!=null ? CustomErrorWidget(errorMessage: currentUserProvider.errorMessage!) : SizedBox.shrink()
            ],
          ),
        ));
      }
    );
  }
}
