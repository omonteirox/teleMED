// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResetPasswordStore on _ResetPasswordBase, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_ResetPasswordBase.isEmailValid'))
          .value;
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_ResetPasswordBase.emailError'))
          .value;

  late final _$emailAtom =
      Atom(name: '_ResetPasswordBase.email', context: context);

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

  late final _$errorAtom =
      Atom(name: '_ResetPasswordBase.error', context: context);

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

  late final _$resetPasswordAsyncAction =
      AsyncAction('_ResetPasswordBase.resetPassword', context: context);

  @override
  Future<bool> resetPassword(String? email) {
    return _$resetPasswordAsyncAction.run(() => super.resetPassword(email));
  }

  late final _$_ResetPasswordBaseActionController =
      ActionController(name: '_ResetPasswordBase', context: context);

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_ResetPasswordBaseActionController.startAction(
        name: '_ResetPasswordBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ResetPasswordBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
error: ${error},
isEmailValid: ${isEmailValid},
emailError: ${emailError}
    ''';
  }
}
