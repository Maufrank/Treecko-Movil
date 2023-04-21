import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:movil/drawer_header.dart';
import 'package:movil/drawer_items.dart';

import 'drawer_items_admin.dart';

class PermisosTuto extends StatefulWidget {
  final String usuario;
  final Map userData;
  const PermisosTuto({Key? key, required this.usuario, required this.userData})
      : super(key: key);

  @override
  State<PermisosTuto> createState() => _FetchDataStateTuto();
}

class _FetchDataStateTuto extends State<PermisosTuto> {
  Widget listItem({required Map permiso}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Color.fromARGB(255, 191, 192, 190),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'motivo',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'fecha',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'aprobacionTutor',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
        ],
      ),
    );
  }

  Widget nombreAlumno({required Map permiso}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 50,
      color: Color.fromARGB(255, 169, 218, 121),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            permiso['nombre'],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String user = widget.usuario;
    Map userData = widget.userData;
    Query dbRef = FirebaseDatabase.instance
        .ref()
        .child('treecko/${userData['division']}/alumno/${userData['carrera']}');
    DatabaseReference reference = FirebaseDatabase.instance
        .ref()
        .child('treecko/${userData['division']}/alumno/${userData['carrera']}');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Permisos de mis alumnos'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerEncabezado(
                correo: userData['carrera'],
                nombre: user,
              ),
              const DrawerItemsTuto(),
            ],
          ),
        ),
        body: Container(
          height: double.infinity,
          child: FirebaseAnimatedList(
            query: dbRef,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map permiso = snapshot.value as Map;
              Map per = permiso['permisos'] as Map;
              per['key'] = snapshot.key;
              // print(per);

              // per.forEach(
              //   (key, value) {
              //     try {
              //       Map permisoMap = per[key] as Map;
              //       print(permisoMap);
              //       return tarjeta(permisoMap);
              //     } catch (e) {
              //       print(e);
              //     }
              // String ma = value as String;
              // Map ma = value as Map<dynamic, dynamic>;
              // Map<dynamic, dynamic> permisoMap = per[key];
              // print(per[key]);
              // Map<String, dynamic> pe = value as Map<String, dynamic>;

              // Map pe = value as Map;
              // listItem(permiso: per[key]);
              //   },
              // );
              // print("$permiso['nombre']  $permiso['apellidos']");
              return listItem(permiso: permiso);
            },
          ),
        ));
  }
}
