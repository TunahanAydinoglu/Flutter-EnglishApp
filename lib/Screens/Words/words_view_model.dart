import 'dart:convert';
import 'dart:io';

import 'package:flutter_auth/models/user_model.dart';
import 'package:flutter_auth/models/userword_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'words_view_model.g.dart';

class WordsViewModel = _WordsViewModelBase with _$WordsViewModel;

abstract class _WordsViewModelBase with Store {
  final baseUrl = "https://retro-words.herokuapp.com/";
  String userId;

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
    await http.post(
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
    await getUserWords(token);
    await getUserLastWords();
  }

  @action
  Future getUserLastWords() async {
    showWords = [...words.sublist(0, user.userLastWordCount - 1)];
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

      final newWords = responseJson['data']
          .map((e) => UserWord.fromJson(e as Map<String, dynamic>))
          .toList()
          .cast<UserWord>();
      words = [...newWords];
      showWords = [...newWords];
    }
  }

  @action
  Future deleteUserWord(UserWord word) async {
    showWords.remove(word);
    showWords = [...showWords];
  }

  @action
  Future postTranslateVocabulary(
      String token, String word, String translatedWord) async {
    var response = await http.post(
      Uri.parse(baseUrl + 'api/translateVocabulary/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': token,
        'Cookie': token
      },
      body: jsonEncode(
          <String, String>{'word': word, 'translation': translatedWord}),
    );

    print(jsonDecode(response.body));
  }
}
