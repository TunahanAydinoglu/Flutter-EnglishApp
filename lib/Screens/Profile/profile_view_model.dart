import 'dart:convert';
import 'dart:io';

import 'package:flutter_auth/models/user_model.dart';
import 'package:flutter_auth/models/userword_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  final baseUrl = "https://retro-words.herokuapp.com/";

  @observable
  List<UserWord> userWords = [];

  @observable
  User user;

  @action
  Future getUserInformation(String token) async {
    final response = await http.get(
      Uri.parse(baseUrl + 'api/auth/user'),
      headers: {HttpHeaders.authorizationHeader: token},
    );

    final responseJson = jsonDecode(response.body);

    user = User.fromJson(responseJson['data']);

    user.profileImage = baseUrl + "uploads/" + user.profileImage;
  }
}
