import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final String message;
  
  //We will use this message to display error if no internet connection
  SplashScreen({this.message = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: this.message == ""
            ? Center(child: Image.asset("assets/images/logo.png"))
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset("assets/images/logo.png"),
                  Center(
                      child: Text(
                    this.message,
                    style: TextStyle(fontSize: 30.0, color: Colors.red),
                  ))
                ],
              ),
      ),
    );
  }
}
