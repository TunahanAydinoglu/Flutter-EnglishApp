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
  List<UserWord> showWords = [];

  @observable
  List<UserWord> words = [];

  @observable
  User user = User();

  @action
  Future getUserLastWords(String token) async {
    if (lastWords.length > 0) {
      showWords = [...lastWords];
    } else {
      final response = await http.get(
        Uri.parse(baseUrl + 'api/words/last'),
        headers: {HttpHeaders.authorizationHeader: token},
      );

      final responseJson = jsonDecode(response.body);

      user = User.fromJson(responseJson['userInfo']);
      user.profileImage = baseUrl + "uploads/" + user.profileImage;

      lastWords = responseJson['data']
          .map((e) => UserWord.fromJson(e as Map<String, dynamic>))
          .toList()
          .cast<UserWord>();

      showWords = lastWords;
    }
  }

  @action
  Future getUserWords(String token) async {
    if (words.length > 0) {
      showWords = [...words];
    } else {
      final response = await http.get(
        Uri.parse(baseUrl + 'api/words'),
        headers: {HttpHeaders.authorizationHeader: token},
      );

      final responseJson = jsonDecode(response.body);

      user = User.fromJson(responseJson['userInfo']);
      user.profileImage = baseUrl + "uploads/" + user.profileImage;

      words = responseJson['data']
          .map((e) => UserWord.fromJson(e as Map<String, dynamic>))
          .toList()
          .cast<UserWord>();

      showWords = words;
    }
  }
}
