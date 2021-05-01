import 'package:dio/dio.dart';
import 'package:flutter_auth/Screens/Login/login_model.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final baseUrl = "https://retro-words.herokuapp.com/api/";

  String email;
  String password;

  @observable
  String token = "";

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
    final mail = "dilan@cetinkaya.com";
    final passw = "070707";
    var response = await Dio()
        .post(baseUrl + "auth/login", data: {'email': mail, "password": passw});
    var responseData = LoginUserModel.fromJson(response.data);
    token = responseData.token;
    print("login VM : " + token);
    return token.length > 0 ? true : false;
  }
}
