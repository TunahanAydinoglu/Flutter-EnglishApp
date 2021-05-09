import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_view_model.dart';
import 'package:flutter_auth/Screens/Words/words_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/build_show_dialog.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_email_field.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _signupViewModel = SignupViewModel();

    getToken() {
      var token = _signupViewModel.signupToken;
      return token;
    }

    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Full Name",
              onChanged: (String fullName) {
                _signupViewModel.onChangeFullName(fullName);
              },
            ),
            RoundedInputEmailField(
              hintText: "Email",
              onChanged: (String email) {
                _signupViewModel.onChangeEmail(email);
              },
            ),
            RoundedPasswordField(
              onChanged: (String password) {
                _signupViewModel.onChangePassword(password);
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                var isSuccess = await _signupViewModel.registerPost();
                print(isSuccess);
                if (isSuccess) {
                  buildShowDialog(context, "welcome", "Let's go to :)");
                  navigationDelayed(context, getToken());
                } else {
                  buildShowDialog(context, "Upss..",
                      "Email may be in use! Check your info pls.");
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushNamed(context, "/signin");
              },
            ),
          ],
        ),
      ),
    );
  }

  navigationDelayed(BuildContext context, String token) async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route(context, token));
  }

  route(BuildContext context, String token) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => WordsScreen(token: token)));
  }
}
