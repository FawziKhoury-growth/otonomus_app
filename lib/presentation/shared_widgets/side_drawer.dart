import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task7/Provider/current_user_provider.dart';
import 'package:task7/models/UserModel.dart';
import 'package:task7/navigator/route_navigator.dart';
import 'package:task7/service/firebase_helper.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? userProvider =
        Provider.of<CurrentUserProvider>(context, listen: true).user;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF3C4955),
            ),
            child: Image.asset("assets/images/logoLetterImage.png"),
          ),
          if (userProvider != null)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${userProvider?.firstName} ${userProvider?.lastName}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    title: const Text('Sign Out'),
                    onTap: () async{
                      await FirebaseHelper().signOutUser(context);
                      
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          if (userProvider == null)
            ListTile(
              title: const Text('Sign in'),
              onTap: () {
                Navigator.pop(context);
                RouteNavigator.goTo("login");
              },
            ),
        ],
      ),
    );
  }
}
