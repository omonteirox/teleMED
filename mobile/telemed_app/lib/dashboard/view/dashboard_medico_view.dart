import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'stores/consulta_store.dart';
import '../model/Consulta.dart';

class DashboardMedico extends StatefulWidget {
  const DashboardMedico({Key? key}) : super(key: key);

  @override
  _DashboardMedicoState createState() => _DashboardMedicoState();
}

class _DashboardMedicoState extends State<DashboardMedico> {
  final ConsultaStore _consultaStore = ConsultaStore();

  @override
  void initState() {
    super.initState();
    _consultaStore.fetchConsultas();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                  const Text(
                    "Telemed",
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                  ),
                ],
              ),
            ),
            Observer(
              builder: (_) {
                if (_consultaStore.loading) {
                  return const CircularProgressIndicator();
                } else if (_consultaStore.error.isNotEmpty) {
                  return Text('Error: ${_consultaStore.error}');
                } else {
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _consultaStore.consultas.length,
                      itemBuilder: (context, index) {
                        Consulta consulta = _consultaStore.consultas[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: SizedBox(
                              width: 250,
                              child: ListTile(
                                leading: const Icon(Icons.event),
                                title: Text(consulta.name),
                                subtitle: Text('Horário: ${consulta.time}'),
                                onTap: () {
                                  // Ação ao tocar em uma consulta
                                  // abrir uma tela com os detalhes da consulta
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext ctx) {
                                        return Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text("PACIENTE"),
                                                  TextButton(
                                                      onPressed: () {
                                                        // roteamento para o perfil do paciente
                                                      },
                                                      child:
                                                          Text("Ver perfil")),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text("MÉDICO"),
                                                  TextButton(
                                                      onPressed: () {
                                                        // roteamento para o perfil do médico
                                                      },
                                                      child:
                                                          Text("Ver perfil")),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text("DATA"),
                                                  TextButton(
                                                      onPressed: () {
                                                        // roteamento para o calendário
                                                      },
                                                      child: Text(
                                                          "Ver calendário")),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text("DESCRIÇÃO"),
                                                  TextButton(
                                                      onPressed: () {
                                                        // roteamento para o webRCT
                                                      },
                                                      child: Text(
                                                          "Entrar na consulta"))
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
