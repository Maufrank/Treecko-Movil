import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:movil/drawer_header.dart';
import 'package:movil/drawer_items.dart';
import 'package:movil/drawer_items_alumno.dart';

class FetchData extends StatefulWidget {
  final String usuario;
  final Map userData;
  const FetchData({Key? key, required this.usuario, required this.userData})
      : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
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
            permiso['motivo'],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            permiso['fecha'],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            permiso['aprobacionTutor'],
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

  @override
  Widget build(BuildContext context) {
    String user = widget.usuario;
    Map userData = widget.userData;
    Query dbRef = FirebaseDatabase.instance.ref().child(
        'treecko/${userData['division']}/alumno/${userData['carrera']}/$user/permisos');
    DatabaseReference reference = FirebaseDatabase.instance.ref().child(
        'treecko/${userData['division']}/alumno/${userData['carrera']}/$user/permisos');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Mis Permisos'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerEncabezado(
                correo: userData['carrera'],
                nombre: user,
              ),
              DrawerItemsAlumno(
                userData: widget.userData,
              ),
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
              permiso['key'] = snapshot.key;

              return listItem(permiso: permiso);
            },
          ),
        ));
  }
}
