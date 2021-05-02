import 'dart:convert';
import 'dart:io';

import 'package:flutter_auth/models/user_model.dart';
import 'package:flutter_auth/models/userword_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'lastwords_view_model.g.dart';

class LastWordsViewModel = _LastWordsViewModelBase with _$LastWordsViewModel;

abstract class _LastWordsViewModelBase with Store {
  final baseUrl = "https://retro-words.herokuapp.com/";
  String userId;

  @observable
  List<UserWord> lastWords = [];

  @observable
  User user = User();

  @action
  Future getUserLastWords(String token) async {
    final response = await http.get(
      Uri.parse(baseUrl + 'api/words/last'),
      headers: {HttpHeaders.authorizationHeader: token},
    );

    final responseJson = jsonDecode(response.body);

    user = User.fromJson(responseJson['userInfo']);
    user.profileImage = baseUrl + "uploads/" + user.profileImage;

    print(user.profileImage);

    lastWords = responseJson['data']
        .map((e) => UserWord.fromJson(e as Map<String, dynamic>))
        .toList()
        .cast<UserWord>();
  }
}
