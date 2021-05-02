import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/LastWords/lastwords_screen.dart';
import 'package:flutter_auth/Screens/Profile/profile_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';

import 'Screens/Login/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/signup': (context) => SignupScreen(),
        '/signin': (context) => LoginScreen(),
        '/profile': (context) => ProfileScreen(),
        '/lastwords': (context) => LastWordsScreen(),
      },
    );
  }
}
