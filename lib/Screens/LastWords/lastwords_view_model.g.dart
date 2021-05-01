// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lastwords_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LastWordsViewModel on _LastWordsViewModelBase, Store {
  final _$lastWordsAtom = Atom(name: '_LastWordsViewModelBase.lastWords');

  @override
  List<LastWord> get lastWords {
    _$lastWordsAtom.reportRead();
    return super.lastWords;
  }

  @override
  set lastWords(List<LastWord> value) {
    _$lastWordsAtom.reportWrite(value, super.lastWords, () {
      super.lastWords = value;
    });
  }

  final _$getUserLastWordsAsyncAction =
      AsyncAction('_LastWordsViewModelBase.getUserLastWords');

  @override
  Future<List<LastWord>> getUserLastWords(String token) {
    return _$getUserLastWordsAsyncAction
        .run(() => super.getUserLastWords(token));
  }

  @override
  String toString() {
    return '''
lastWords: ${lastWords}
    ''';
  }
}
