import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerItemsAlumno extends StatelessWidget {
  final Map userData;

  const DrawerItemsAlumno({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Solicitar permiso'),
          onTap: () {
            print(userData);
          },
        ),
        ListTile(
          title: const Text('Conocenos'),
          onTap: () => Get.offAndToNamed('info'),
        ),
        ListTile(
          title: const Text('Salir'),
          onTap: () => Get.offAndToNamed('login'),
        )
      ],
    );
  }
}
