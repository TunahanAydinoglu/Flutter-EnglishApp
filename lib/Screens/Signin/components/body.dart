import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Words/words_screen.dart';
import 'package:flutter_auth/Screens/Signin/components/background.dart';
import 'package:flutter_auth/Screens/Signin/signin_view_model.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/build_show_dialog.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _signinViewModel = SigninViewModel();
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN IN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (String mail) {
                _signinViewModel.onChangeEmail(mail);
              },
            ),
            RoundedPasswordField(
              onChanged: (String passw) {
                _signinViewModel.onChangePassword(passw);
              },
            ),
            RoundedButton(
              text: "SIGN IN",
              press: () async {
                var isSuccess = await _signinViewModel.loginPost();
                if (isSuccess) {
                  var token = _signinViewModel.token;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WordsScreen(token: token)));
                } else {
                  buildShowDialog(context, "Upps wrong parameters!!!",
                      "Please check your info.");
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushNamed(context, "/signup");
              },
            ),
          ],
        ),
      ),
    );
  }
}
