// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConsultaStore on _ConsultaStore, Store {
  late final _$consultasAtom =
      Atom(name: '_ConsultaStore.consultas', context: context);

  @override
  ObservableList<Consulta> get consultas {
    _$consultasAtom.reportRead();
    return super.consultas;
  }

  @override
  set consultas(ObservableList<Consulta> value) {
    _$consultasAtom.reportWrite(value, super.consultas, () {
      super.consultas = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_ConsultaStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom = Atom(name: '_ConsultaStore.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$_ConsultaStoreActionController =
      ActionController(name: '_ConsultaStore', context: context);

  @override
  void fetchConsultas() {
    final _$actionInfo = _$_ConsultaStoreActionController.startAction(
        name: '_ConsultaStore.fetchConsultas');
    try {
      return super.fetchConsultas();
    } finally {
      _$_ConsultaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
consultas: ${consultas},
loading: ${loading},
error: ${error}
    ''';
  }
}
