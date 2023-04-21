import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerItemsTuto extends StatelessWidget {
  const DrawerItemsTuto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ListTile(
        //   title: const Text('Mis Listas'),
        //   onTap: () => Get.offAllNamed('home'),
        // ),
        ListTile(
          title: const Text('Conocenos'),
          onTap: () => Get.offAndToNamed('info'),
        ),
        ListTile(
          title: const Text('Registrar alumno'),
          onTap: () => Get.offAndToNamed('agregar'),
        ),
        ListTile(
          title: const Text('Salir'),
          onTap: () => Get.offAndToNamed('login'),
        )
      ],
    );
  }
}
