import 'package:flutter/material.dart';
import 'package:task7/presentation/screens/loading_screen.dart';

import '../presentation/screens/login_page.dart';
import '../presentation/screens/home_page_screen.dart';
import '../presentation/screens/signup_page.dart';





class RouteGenerator{
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    final String routeName = settings.name!;

    switch (routeName){
      case '/' :
        return MaterialPageRoute(builder: (_) => HomePageScreen());
      case '/login' :
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/signup' : 
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/loadingScreen' : 
        return MaterialPageRoute(builder: (_) => LoadingScreen());
      default:
        return MaterialPageRoute(builder: (_) => errorRoute());
    }
  }
}

class errorRoute extends StatelessWidget {
  const errorRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('404 Not Found')),
      body: Center(child: Text('Page not found')),
    );
  }
}


