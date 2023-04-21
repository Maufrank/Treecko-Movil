import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerEncabezado extends StatelessWidget {
  final String nombre;
  final String correo;

  const DrawerEncabezado({Key? key, required this.nombre, required this.correo})
      : super(key: key);
  // const DrawerEncabezado({super.key});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(correo, style: const TextStyle(color: Colors.black)),
      accountEmail: Text(
        nombre,
        style: const TextStyle(color: Colors.black),
      ),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
        "https://scontent.ftgz3-1.fna.fbcdn.net/v/t39.30808-6/341526270_948220759926472_6179587328864225519_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=e3f864&_nc_ohc=d1WF2B6kfYoAX_jQHLl&_nc_ht=scontent.ftgz3-1.fna&oh=00_AfCPZYAbFq3QUjEz78C7R3ETd4WWjZRsT76J65_-KRZ9vA&oe=64462EA5",
      ))),
    );
  }
}
