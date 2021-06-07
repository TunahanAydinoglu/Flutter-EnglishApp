import 'package:dio/dio.dart';
import 'package:flutter_auth/models/login_model.dart';
import 'package:mobx/mobx.dart';
part 'signin_view_model.g.dart';

class SigninViewModel = _SigninViewModelBase with _$SigninViewModel;

abstract class _SigninViewModelBase with Store {
  final baseUrl = "https://retro-words.herokuapp.com/api/";

  String email;
  String password;

  @observable
  String token;

  @action
  onChangeEmail(String mail) {
    email = mail;
  }

  @action
  onChangePassword(String passw) {
    password = passw;
  }

  @action
  Future<bool> loginPost() async {
    var response = await Dio().post(baseUrl + "auth/login",
        data: {'email': email, "password": password});
    var responseData = LoginUserModel.fromJson(response.data);
    token = responseData.token;
    // print("login VM : " + token);
    return token.length > 0 ? true : false;
  }
}
