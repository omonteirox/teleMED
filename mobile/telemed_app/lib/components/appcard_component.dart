import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppCardView extends StatefulWidget implements PreferredSizeWidget {
  const AppCardView({super.key});

  @override
  State<AppCardView> createState() => _AppCardViewState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppCardViewState extends State<AppCardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5, // Número de consultas
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  width: 200,
                  child: ListTile(
                    leading: Icon(Icons.event),
                    title: Text('Consulta ${index + 1}'),
                    subtitle: Text('Horário: 10:00 AM'),
                    onTap: () {
                      // Ação ao tocar em uma consulta
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
