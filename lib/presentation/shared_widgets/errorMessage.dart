
import 'package:flutter/material.dart';

class ErrorMessage{
  void showErrorSnackbar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        errorMessage,
        style: TextStyle(
          color: Color(0xFFAE2D3C),
          fontSize: 12.0,
          fontFamily: "MontserratMedium",
        ),
      ),
      backgroundColor: Color(0xFFEAD5D8),
      
      behavior: SnackBarBehavior.floating, // Display at the top
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom-100,
        right: 20,
        left: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(9.0)),
        side: BorderSide(color: Color(0xFFAE2D3C)),
      ),
     
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Color(0xFFAE2D3C), // Set action button text color
        onPressed: () {
          // Handle action button tap here
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
}