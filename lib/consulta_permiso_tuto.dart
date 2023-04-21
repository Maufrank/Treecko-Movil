import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:movil/permiso_ver.dart';

import 'drawer_header.dart';
import 'drawer_items.dart';
import 'drawer_items_admin.dart';
import 'model/permiso_modelo.dart';

class PermisoVistaT extends StatefulWidget {
  final List<Permiso> listPermisos;

  const PermisoVistaT({Key? key, required this.listPermisos}) : super(key: key);

  @override
  State<PermisoVistaT> createState() => _PermisoVistaTState();
}

class _PermisoVistaTState extends State<PermisoVistaT> {
  @override
  Widget build(BuildContext context) {
    final List<Permiso> listaPermisos = widget.listPermisos;

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
            const DrawerItemsTuto(),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: listaPermisos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(listaPermisos[index].nombre +
                  ' ' +
                  listaPermisos[index].apellidos),
              subtitle: Text(
                'Aprobacion: ' +
                    listaPermisos[index].aprobacion +
                    '\nMotivo: ' +
                    listaPermisos[index].motivo +
                    '\nFecha: ' +
                    listaPermisos[index].fecha,
              ),
              leading: CircleAvatar(
                child: Text(listaPermisos[index].nombre.substring(0, 1)),
              ),
              onTap: () {
                print(listaPermisos[index].nombre);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PermisoVer(
                              permiso: listaPermisos[index],
                            )));
              },
              trailing: const Icon(Icons.arrow_forward_ios),
              minLeadingWidth: 100,
              minVerticalPadding: 20,
            );
          }),
    );
  }
}
