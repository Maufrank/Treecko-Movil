import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:movil/model/usuario_modelo.dart';
import 'package:movil/permiso_ver.dart';

import 'drawer_header.dart';
import 'drawer_items.dart';
import 'model/permiso_modelo.dart';

class UsuariosVistaT extends StatefulWidget {
  final List<Usuario> listUsuario;

  const UsuariosVistaT({Key? key, required this.listUsuario}) : super(key: key);

  @override
  State<UsuariosVistaT> createState() => _UsuarioVistaTState();
}

class _UsuarioVistaTState extends State<UsuariosVistaT> {
  @override
  Widget build(BuildContext context) {
    final List<Usuario> listaUsuarios = widget.listUsuario;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Permisos'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerEncabezado(
              correo: 'MauMau',
              nombre: 'Mau',
            ),
            const DrawerItems(),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: listaUsuarios.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listaUsuarios[index].username + ' '),
              subtitle: Text('Rol: ' +
                  listaUsuarios[index].rol +
                  '  Division: ' +
                  listaUsuarios[index].division),
              leading: CircleAvatar(
                child: Text(listaUsuarios[index].username.substring(0, 1)),
              ),
              // onTap: () {
              //   print(listaPermisos[index].nombre);
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => PermisoVer(
              //                 permiso: listaPermisos[index],
              //               )));
              // },
              trailing: const Icon(Icons.arrow_forward_ios),
              minLeadingWidth: 100,
              minVerticalPadding: 20,
            );
          }),
    );
  }
}
