import 'dart:convert';
import 'package:flutter_auth/models/register_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'signup_view_model.g.dart';

class SignupViewModel = _SignupViewModelBase with _$SignupViewModel;

abstract class _SignupViewModelBase with Store {
  final baseUrl = "https://retro-words.herokuapp.com/api/";

  String fullName;
  String email;
  String password;

  @observable
  String signupToken;

  @action
  onChangeFullName(String name) {
    fullName = name;
  }

  @action
  onChangeEmail(String mail) {
    email = mail;
  }

  @action
  onChangePassword(String passw) {
    password = passw;
  }

  @action
  Future<bool> registerPost() async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var request = http.Request('POST', Uri.parse(baseUrl + 'auth/register'));
    var full = "deneme name";
    var mail = "deneemeee@name.com";
    var passw = "123123";
    request.body = jsonEncode({'name': full, 'email': mail, 'password': passw});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    final respStr = await response.stream.bytesToString();
    final responseJson = jsonDecode(respStr);

    var result = RegisterResponseModel.fromJson(responseJson);

    signupToken = result.token;

    return result.success;
  }
}
