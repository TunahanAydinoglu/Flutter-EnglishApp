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

  String addText = "";

  @observable
  User user = User();

  @action
  onChangeAddText(String add) {
    addText = add;
  }

  @action
  Future addWords(String token) async {
    var response = await http.post(
      Uri.parse(baseUrl + 'api/words/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
        'Cookie': token
      },
      body: jsonEncode(<String, String>{
        'text': addText,
      }),
    );
    print(response);
    // showWords.clear();
    getUserLastWords(token);
  }

  @action
  Future getUserLastWords(String token) async {
    showWords = words.sublist(0, user.userLastWordCount);
  }

  @action
  Future getUserWords(String token) async {
    // if (words.length > 0) {
    //   showWords = [...words];
    // } else {
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
    // }
  }
}
