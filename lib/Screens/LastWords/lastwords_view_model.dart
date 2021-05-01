import 'dart:convert';
import 'dart:io';

import 'package:flutter_auth/Screens/LastWords/lastwords_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'lastwords_view_model.g.dart';

class LastWordsViewModel = _LastWordsViewModelBase with _$LastWordsViewModel;

abstract class _LastWordsViewModelBase with Store {
  final baseUrl = "https://retro-words.herokuapp.com/api/";
  String userId;

  @observable
  List<LastWord> lastWords = [];

  @action
  Future<List<LastWord>> getUserLastWords(String token) async {
    final response = await http.get(
      Uri.parse('https://retro-words.herokuapp.com/api/words'),
      headers: {HttpHeaders.authorizationHeader: token},
    );

    final responseJson = jsonDecode(response.body);

    lastWords = responseJson['data']
        .map((e) => LastWord.fromJson(e as Map<String, dynamic>))
        .toList()
        .cast<LastWord>();

    return lastWords;
  }
}
