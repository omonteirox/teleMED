// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_LoginStoreBase.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_LoginStoreBase.isPasswordValid'))
          .value;
  Computed<String?>? _$passwordErrorComputed;

  @override
  String? get passwordError =>
      (_$passwordErrorComputed ??= Computed<String?>(() => super.passwordError,
              name: '_LoginStoreBase.passwordError'))
          .value;
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_LoginStoreBase.emailError'))
          .value;

  late final _$emailAtom =
      Atom(name: '_LoginStoreBase.email', context: context);

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

  late final _$passwordAtom =
      Atom(name: '_LoginStoreBase.password', context: context);

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

  late final _$rememberPasswordAtom =
      Atom(name: '_LoginStoreBase.rememberPassword', context: context);

  @override
  bool get rememberPassword {
    _$rememberPasswordAtom.reportRead();
    return super.rememberPassword;
  }

  @override
  set rememberPassword(bool value) {
    _$rememberPasswordAtom.reportWrite(value, super.rememberPassword, () {
      super.rememberPassword = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_LoginStoreBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$visiblePasswordAtom =
      Atom(name: '_LoginStoreBase.visiblePassword', context: context);

  @override
  bool get visiblePassword {
    _$visiblePasswordAtom.reportRead();
    return super.visiblePassword;
  }

  @override
  set visiblePassword(bool value) {
    _$visiblePasswordAtom.reportWrite(value, super.visiblePassword, () {
      super.visiblePassword = value;
    });
  }

  late final _$savePasswordAsyncAction =
      AsyncAction('_LoginStoreBase.savePassword', context: context);

  @override
  Future savePassword(String? value) {
    return _$savePasswordAsyncAction.run(() => super.savePassword(value));
  }

  late final _$readRememberAsyncAction =
      AsyncAction('_LoginStoreBase.readRemember', context: context);

  @override
  Future<void> readRemember() {
    return _$readRememberAsyncAction.run(() => super.readRemember());
  }

  late final _$saveRememberAsyncAction =
      AsyncAction('_LoginStoreBase.saveRemember', context: context);

  @override
  Future<void> saveRemember(bool remember) {
    return _$saveRememberAsyncAction.run(() => super.saveRemember(remember));
  }

  late final _$readPasswordAsyncAction =
      AsyncAction('_LoginStoreBase.readPassword', context: context);

  @override
  Future<String> readPassword() {
    return _$readPasswordAsyncAction.run(() => super.readPassword());
  }

  late final _$loginWithEmailAsyncAction =
      AsyncAction('_LoginStoreBase.loginWithEmail', context: context);

  @override
  Future<void> loginWithEmail(
      String? email, String? password, bool rememberPassword) {
    return _$loginWithEmailAsyncAction
        .run(() => super.loginWithEmail(email, password, rememberPassword));
  }

  late final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase', context: context);

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRememberPassword(bool value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setRememberPassword');
    try {
      return super.setRememberPassword(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setVisiblePassword(bool value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setVisiblePassword');
    try {
      return super.setVisiblePassword(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
rememberPassword: ${rememberPassword},
error: ${error},
visiblePassword: ${visiblePassword},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
passwordError: ${passwordError},
emailError: ${emailError}
    ''';
  }
}
