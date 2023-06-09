import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../model/Consulta.dart';
part 'consulta_store.g.dart';

class ConsultaStore = _ConsultaStore with _$ConsultaStore;

abstract class _ConsultaStore with Store {
  @observable
  ObservableList<Consulta> consultas = ObservableList<Consulta>();

  @observable
  bool loading = false;

  @observable
  String error = '';

  @action
  void fetchConsultas() {
    loading = true;
    error = '';

    // Simulando a busca das consultas
    // Substitua essa lógica pela sua implementação real
    Future.delayed(Duration(seconds: 2), () {
      List<Consulta> consultasMock = [
        Consulta(nome: 'Consulta 1', horario: '10:00 AM'),
        Consulta(nome: 'Consulta 2', horario: '11:30 AM'),
        Consulta(nome: 'Consulta 3', horario: '2:00 PM'),
      ];
      consultas = ObservableList.of(consultasMock);
      loading = false;
    }).catchError((e) {
      error = 'Failed to fetch consultas: $e';
      loading = false;
    });
  }
}
