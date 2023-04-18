// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpStore on _SignUpStoreBase, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_SignUpStoreBase.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_SignUpStoreBase.isPasswordValid'))
          .value;
  Computed<String?>? _$passwordErrorComputed;

  @override
  String? get passwordError =>
      (_$passwordErrorComputed ??= Computed<String?>(() => super.passwordError,
              name: '_SignUpStoreBase.passwordError'))
          .value;
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_SignUpStoreBase.emailError'))
          .value;

  late final _$nameAtom = Atom(name: '_SignUpStoreBase.name', context: context);

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

  late final _$emailAtom =
      Atom(name: '_SignUpStoreBase.email', context: context);

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
      Atom(name: '_SignUpStoreBase.password', context: context);

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

  late final _$visiblePasswordAtom =
      Atom(name: '_SignUpStoreBase.visiblePassword', context: context);

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

  late final _$signUpAsyncAction =
      AsyncAction('_SignUpStoreBase.signUp', context: context);

  @override
  Future<bool> signUp(String? name, String? email, String? password) {
    return _$signUpAsyncAction.run(() => super.signUp(name, email, password));
  }

  late final _$_SignUpStoreBaseActionController =
      ActionController(name: '_SignUpStoreBase', context: context);

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setVisiblePassword(bool value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.setVisiblePassword');
    try {
      return super.setVisiblePassword(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
password: ${password},
visiblePassword: ${visiblePassword},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
passwordError: ${passwordError},
emailError: ${emailError}
    ''';
  }
}
