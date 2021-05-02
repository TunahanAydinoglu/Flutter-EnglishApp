// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupViewModel on _SignupViewModelBase, Store {
  final _$fullNameAtom = Atom(name: '_SignupViewModelBase.fullName');

  @override
  String get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignupViewModelBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignupViewModelBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$registerPostAsyncAction =
      AsyncAction('_SignupViewModelBase.registerPost');

  @override
  Future<bool> registerPost() {
    return _$registerPostAsyncAction.run(() => super.registerPost());
  }

  final _$_SignupViewModelBaseActionController =
      ActionController(name: '_SignupViewModelBase');

  @override
  dynamic onChangeFullName(String name) {
    final _$actionInfo = _$_SignupViewModelBaseActionController.startAction(
        name: '_SignupViewModelBase.onChangeFullName');
    try {
      return super.onChangeFullName(name);
    } finally {
      _$_SignupViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeEmail(String mail) {
    final _$actionInfo = _$_SignupViewModelBaseActionController.startAction(
        name: '_SignupViewModelBase.onChangeEmail');
    try {
      return super.onChangeEmail(mail);
    } finally {
      _$_SignupViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangePassword(String passw) {
    final _$actionInfo = _$_SignupViewModelBaseActionController.startAction(
        name: '_SignupViewModelBase.onChangePassword');
    try {
      return super.onChangePassword(passw);
    } finally {
      _$_SignupViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fullName: ${fullName},
email: ${email},
password: ${password}
    ''';
  }
}
