// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WordsViewModel on _WordsViewModelBase, Store {
  final _$showWordsAtom = Atom(name: '_WordsViewModelBase.showWords');

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

  final _$wordsAtom = Atom(name: '_WordsViewModelBase.words');

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

  final _$userAtom = Atom(name: '_WordsViewModelBase.user');

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

  final _$addWordsAsyncAction = AsyncAction('_WordsViewModelBase.addWords');

  @override
  Future<dynamic> addWords(String token) {
    return _$addWordsAsyncAction.run(() => super.addWords(token));
  }

  final _$getUserLastWordsAsyncAction =
      AsyncAction('_WordsViewModelBase.getUserLastWords');

  @override
  Future<dynamic> getUserLastWords() {
    return _$getUserLastWordsAsyncAction.run(() => super.getUserLastWords());
  }

  final _$getUserWordsAsyncAction =
      AsyncAction('_WordsViewModelBase.getUserWords');

  @override
  Future<dynamic> getUserWords(String token) {
    return _$getUserWordsAsyncAction.run(() => super.getUserWords(token));
  }

  final _$_WordsViewModelBaseActionController =
      ActionController(name: '_WordsViewModelBase');

  @override
  dynamic onChangeAddText(String add) {
    final _$actionInfo = _$_WordsViewModelBaseActionController.startAction(
        name: '_WordsViewModelBase.onChangeAddText');
    try {
      return super.onChangeAddText(add);
    } finally {
      _$_WordsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showWords: ${showWords},
words: ${words},
user: ${user}
    ''';
  }
}
