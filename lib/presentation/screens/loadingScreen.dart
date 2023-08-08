import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task7/Provider/current_user_provider.dart';
import 'package:task7/presentation/screens/property_display.dart';
import 'package:task7/service/firebase_helper.dart';
import '../../navigator/route_navigator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  firebase_helper firebaseHelper = firebase_helper();
  @override
  void initState() {
    super.initState();
    // Use a delay to ensure that the context is available

    initDatabase();
  }

  void initDatabase() {
    Future.delayed(Duration.zero, () async {     
      await Provider.of<CurrentUser>(context, listen: false).fetchUser();
      RouteNavigator.goTo("home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Image.asset('assets/images/loadingScreen.jpg', height: 500, width: 400,),
          Text("drferfderfd")
        ],
      )),
    );
  }
}
