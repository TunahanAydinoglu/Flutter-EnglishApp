// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lastwords_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LastWordsViewModel on _LastWordsViewModelBase, Store {
  final _$lastWordsAtom = Atom(name: '_LastWordsViewModelBase.lastWords');

  @override
  List<UserWord> get lastWords {
    _$lastWordsAtom.reportRead();
    return super.lastWords;
  }

  @override
  set lastWords(List<UserWord> value) {
    _$lastWordsAtom.reportWrite(value, super.lastWords, () {
      super.lastWords = value;
    });
  }

  final _$showWordsAtom = Atom(name: '_LastWordsViewModelBase.showWords');

  @override
  List<UserWord> get showWords {
    _$showWordsAtom.reportRead();
    return super.showWords;
  }

  @override
  set showWords(List<UserWord> value) {
    _$showWordsAtom.reportWrite(value, super.showWords, () {
      super.showWords = value;
    });
  }

  final _$wordsAtom = Atom(name: '_LastWordsViewModelBase.words');

  @override
  List<UserWord> get words {
    _$wordsAtom.reportRead();
    return super.words;
  }

  @override
  set words(List<UserWord> value) {
    _$wordsAtom.reportWrite(value, super.words, () {
      super.words = value;
    });
  }

  final _$userAtom = Atom(name: '_LastWordsViewModelBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$getUserLastWordsAsyncAction =
      AsyncAction('_LastWordsViewModelBase.getUserLastWords');

  @override
  Future<dynamic> getUserLastWords(String token) {
    return _$getUserLastWordsAsyncAction
        .run(() => super.getUserLastWords(token));
  }

  final _$getUserWordsAsyncAction =
      AsyncAction('_LastWordsViewModelBase.getUserWords');

  @override
  Future<dynamic> getUserWords(String token) {
    return _$getUserWordsAsyncAction.run(() => super.getUserWords(token));
  }

  @override
  String toString() {
    return '''
lastWords: ${lastWords},
showWords: ${showWords},
words: ${words},
user: ${user}
    ''';
  }
}
