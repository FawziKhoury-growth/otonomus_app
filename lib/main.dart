import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task7/Provider/current_user_provider.dart';
import 'package:task7/presentation/screens/signup_page.dart';
import 'package:task7/Provider/list_Provider.dart';
import 'package:task7/Provider/list_property_provider.dart';
import 'package:task7/presentation/screens/country_state_language.dart';
import 'package:task7/presentation/screens/login_page.dart';
import 'package:task7/presentation/screens/home_page_screen.dart';

import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'navigator/route_generator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListProvider(),),
        ChangeNotifierProvider(create: (context) => ListPropertyProvider(),),
        ChangeNotifierProvider(create: (context) => CurrentUserProvider(),),
      

      ],
      child: MyApp(),
    ),
  
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      initialRoute: '/loadingScreen',
      navigatorKey: RouteGenerator.navigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
    );
  }
}
