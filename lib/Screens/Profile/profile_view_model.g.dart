// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileViewModel on _ProfileViewModelBase, Store {
  final _$userWordsAtom = Atom(name: '_ProfileViewModelBase.userWords');

  @override
  List<UserWord> get userWords {
    _$userWordsAtom.reportRead();
    return super.userWords;
  }

  @override
  set userWords(List<UserWord> value) {
    _$userWordsAtom.reportWrite(value, super.userWords, () {
      super.userWords = value;
    });
  }

  final _$userAtom = Atom(name: '_ProfileViewModelBase.user');

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

  final _$getUserWordsAsyncAction =
      AsyncAction('_ProfileViewModelBase.getUserWords');

  @override
  Future<dynamic> getUserWords(String token) {
    return _$getUserWordsAsyncAction.run(() => super.getUserWords(token));
  }

  @override
  String toString() {
    return '''
userWords: ${userWords},
user: ${user}
    ''';
  }
}
