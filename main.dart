import 'package:flutter/material.dart';
import 'package:untitled1/login.dart';
import 'package:untitled1/signup.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => MyLogin(),
        'signup': (context) => MySignup(),
      }
  ),
  );
}