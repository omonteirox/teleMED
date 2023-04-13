// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStoreBase, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_UserStoreBase.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_UserStoreBase.isPasswordValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_UserStoreBase.isFormValid'))
          .value;
  Computed<String?>? _$passwordErrorComputed;

  @override
  String? get passwordError =>
      (_$passwordErrorComputed ??= Computed<String?>(() => super.passwordError,
              name: '_UserStoreBase.passwordError'))
          .value;
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_UserStoreBase.emailError'))
          .value;
  Computed<String?>? _$phoneErrorComputed;

  @override
  String? get phoneError =>
      (_$phoneErrorComputed ??= Computed<String?>(() => super.phoneError,
              name: '_UserStoreBase.phoneError'))
          .value;

  late final _$visiblePasswordAtom =
      Atom(name: '_UserStoreBase.visiblePassword', context: context);

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

  late final _$nameAtom = Atom(name: '_UserStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$phoneAtom = Atom(name: '_UserStoreBase.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$emailAtom = Atom(name: '_UserStoreBase.email', context: context);

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
      Atom(name: '_UserStoreBase.password', context: context);

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
      Atom(name: '_UserStoreBase.rememberPassword', context: context);

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

  late final _$isLoggedInAtom =
      Atom(name: '_UserStoreBase.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$saveRememberAsyncAction =
      AsyncAction('_UserStoreBase.saveRemember', context: context);

  @override
  Future<bool> saveRemember() {
    return _$saveRememberAsyncAction.run(() => super.saveRemember());
  }

  late final _$readRememberAsyncAction =
      AsyncAction('_UserStoreBase.readRemember', context: context);

  @override
  Future<bool> readRemember() {
    return _$readRememberAsyncAction.run(() => super.readRemember());
  }

  late final _$savePasswordAsyncAction =
      AsyncAction('_UserStoreBase.savePassword', context: context);

  @override
  Future<void> savePassword() {
    return _$savePasswordAsyncAction.run(() => super.savePassword());
  }

  late final _$readPasswordAsyncAction =
      AsyncAction('_UserStoreBase.readPassword', context: context);

  @override
  Future<String> readPassword() {
    return _$readPasswordAsyncAction.run(() => super.readPassword());
  }

  late final _$_UserStoreBaseActionController =
      ActionController(name: '_UserStoreBase', context: context);

  @override
  dynamic setVisiblePassword(bool value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setVisiblePassword');
    try {
      return super.setVisiblePassword(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhone(String value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRememberPassword(bool value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setRememberPassword');
    try {
      return super.setRememberPassword(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
visiblePassword: ${visiblePassword},
name: ${name},
phone: ${phone},
email: ${email},
password: ${password},
rememberPassword: ${rememberPassword},
isLoggedIn: ${isLoggedIn},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isFormValid: ${isFormValid},
passwordError: ${passwordError},
emailError: ${emailError},
phoneError: ${phoneError}
    ''';
  }
}
