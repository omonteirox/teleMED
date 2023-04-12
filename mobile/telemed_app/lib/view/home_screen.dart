import 'package:flutter/material.dart';
import 'package:telemed_app/components/appbar_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMed(title: "Home"),
      body: Placeholder(),
    );
  }
}
