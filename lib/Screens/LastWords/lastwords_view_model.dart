import 'dart:io';

import 'package:flutter_auth/Screens/LastWords/lastwords_model.dart';
import 'package:flutter_auth/Screens/Login/login_view_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'lastwords_view_model.g.dart';

class LastWordsViewModel = _LastWordsViewModelBase with _$LastWordsViewModel;

abstract class _LastWordsViewModelBase with Store {
  final _loginViewModel = LoginViewModel();

  final baseUrl = "https://retro-words.herokuapp.com/api/";
  String userId;

  @observable
  List<LastWord> lastWords;

  @action
  Future<bool> getUserLastWords() async {
    var data = await fetchAlbum(_loginViewModel.token);
    print(_loginViewModel.token);
    print("deneme" + data.body);
    return false;
  }

  @action
  Future<http.Response> fetchAlbum(String token) async {
    return await http.get(
      Uri.parse('https://retro-words.herokuapp.com/api/words'),
      headers: {HttpHeaders.authorizationHeader: token},
    );
  }
}
