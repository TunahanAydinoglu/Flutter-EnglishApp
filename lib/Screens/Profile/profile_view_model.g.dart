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

  final _$isShowCountAtom = Atom(name: '_ProfileViewModelBase.isShowCount');

  @override
  int get isShowCount {
    _$isShowCountAtom.reportRead();
    return super.isShowCount;
  }

  @override
  set isShowCount(int value) {
    _$isShowCountAtom.reportWrite(value, super.isShowCount, () {
      super.isShowCount = value;
    });
  }

  final _$getUserInformationAsyncAction =
      AsyncAction('_ProfileViewModelBase.getUserInformation');

  @override
  Future<dynamic> getUserInformation(String token) {
    return _$getUserInformationAsyncAction
        .run(() => super.getUserInformation(token));
  }

  final _$_ProfileViewModelBaseActionController =
      ActionController(name: '_ProfileViewModelBase');

  @override
  dynamic onChangeUserIsCount(int value) {
    final _$actionInfo = _$_ProfileViewModelBaseActionController.startAction(
        name: '_ProfileViewModelBase.onChangeUserIsCount');
    try {
      return super.onChangeUserIsCount(value);
    } finally {
      _$_ProfileViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userWords: ${userWords},
user: ${user},
isShowCount: ${isShowCount}
    ''';
  }
}
