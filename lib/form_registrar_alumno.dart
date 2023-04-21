import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AgregarAlumno extends StatelessWidget {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();
  final TextEditingController divisionController = TextEditingController();
  final TextEditingController carreraController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController grupoController = TextEditingController();
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController contraController = TextEditingController();
  final ref = FirebaseDatabase.instance.ref();
  List carreras = ['Desarrollo de software', 'Infraestructura de redes'];
  List divisiones = ['tic', 'ird'];
  String carreraF = '';
  String divisionF = '';
  String errorName = '';

  AgregarAlumno({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Alumno')),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nombre'),
            controller: nombreController,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Apellidos'),
            controller: apellidosController,
          ),
          const SizedBox(
            height: 20,
          ),
          // TextFormField(
          //   decoration: const InputDecoration(labelText: 'Division'),
          //   controller: divisionController,
          // ),
          DropdownButtonFormField(
              decoration:
                  const InputDecoration(labelText: 'Escoge tu division'),
              items: divisiones.map((division) {
                // ignore: sort_child_properties_last
                return DropdownMenuItem(
                  value: division,
                  child: Text(division),
                );
              }).toList(),
              onChanged: (value) {
                print(value);
                divisionF = value as String;
              }),
          const SizedBox(
            height: 20,
          ),
          // TextFormField(
          //   decoration: const InputDecoration(labelText: 'Carrera'),
          //   controller: carreraController,
          // ),
          DropdownButtonFormField(
              decoration: const InputDecoration(labelText: 'Escoge tu carrera'),
              items: carreras.map((carrera) {
                // ignore: sort_child_properties_last
                return DropdownMenuItem(
                  value: carrera,
                  child: Text(carrera),
                );
              }).toList(),
              onChanged: (value) {
                print(value);
                carreraF = value as String;
              }),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Correo'),
            controller: correoController,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Grupo'),
            controller: grupoController,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Nombre de usuario'),
            controller: usuarioController,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Contraseña'),
            controller: contraController,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    Map<String, String> datos = {
                      'nombre': nombreController.value.text,
                      'apellidos': apellidosController.value.text,
                      'division': divisionF,
                      'Carrera': carreraF,
                      'correo': correoController.value.text,
                      'grupo': grupoController.value.text,
                      'Contraseña': contraController.value.text,
                    };
                    print(datos);
                    DatabaseReference referencia = FirebaseDatabase.instance.ref(
                        '/treecko/$divisionF/alumno/$carreraF/${usuarioController.value.text}');

                    DatabaseReference referenciaUser = FirebaseDatabase.instance
                        .ref(
                            '/treecko/usuarios/${usuarioController.value.text}');

                    Map<String, String> userData = {
                      'rol': 'alumno',
                      'division': divisionF,
                      'carrera': carreraF,
                      'password': contraController.value.text,
                    };
                    // referenciaUser.push().set(userData);
                    // referencia.push().set(datos);

                    await referenciaUser.update(userData);
                    await referencia.update(datos);

                    Color backgroundcolor =
                        // ignore: use_build_context_synchronously
                        Theme.of(context).primaryColorLight;
                    Get.snackbar("Treecko", "Alumno registrado",
                        backgroundColor: backgroundcolor);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgregarAlumno()));
                  },
                  child: const Text('Registrarme')),
            ],
          )
        ]),
      )),
    );
  }
}
