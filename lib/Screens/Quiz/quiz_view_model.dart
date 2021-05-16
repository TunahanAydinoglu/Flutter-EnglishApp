import 'dart:convert';
import 'dart:io';

import 'package:flutter_auth/models/quiz_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'quiz_view_model.g.dart';

class QuizViewModel = _QuizViewModelBase with _$QuizViewModel;

abstract class _QuizViewModelBase with Store {
  final baseUrl = "https://retro-words.herokuapp.com/api/";

  @observable
  QuizModel quizResponse;

  @observable
  List<Question> quizResponseData = [];

  @action
  Future<bool> getQuizAsync(String token) async {
    final response = await http.get(
      Uri.parse(baseUrl + 'words/quiz'),
      headers: {HttpHeaders.authorizationHeader: token},
    );
    final responseJson = jsonDecode(response.body);
    quizResponse = QuizModel.fromJson(responseJson);
    quizResponseData = [...quizResponse.data];

    return quizResponse.success;
  }
}
