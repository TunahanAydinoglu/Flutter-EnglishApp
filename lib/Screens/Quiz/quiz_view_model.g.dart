// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuizViewModel on _QuizViewModelBase, Store {
  final _$quizResponseAtom = Atom(name: '_QuizViewModelBase.quizResponse');

  @override
  QuizModel get quizResponse {
    _$quizResponseAtom.reportRead();
    return super.quizResponse;
  }

  @override
  set quizResponse(QuizModel value) {
    _$quizResponseAtom.reportWrite(value, super.quizResponse, () {
      super.quizResponse = value;
    });
  }

  final _$quizResponseDataAtom =
      Atom(name: '_QuizViewModelBase.quizResponseData');

  @override
  List<Question> get quizResponseData {
    _$quizResponseDataAtom.reportRead();
    return super.quizResponseData;
  }

  @override
  set quizResponseData(List<Question> value) {
    _$quizResponseDataAtom.reportWrite(value, super.quizResponseData, () {
      super.quizResponseData = value;
    });
  }

  final _$getQuizAsyncAsyncAction =
      AsyncAction('_QuizViewModelBase.getQuizAsync');

  @override
  Future<bool> getQuizAsync(String token) {
    return _$getQuizAsyncAsyncAction.run(() => super.getQuizAsync(token));
  }

  @override
  String toString() {
    return '''
quizResponse: ${quizResponse},
quizResponseData: ${quizResponseData}
    ''';
  }
}
