// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class AgregarPermiso extends StatefulWidget {
//   final Map userData;

// ;

//   const AgregarPermiso({super.key, required this.userData});

//   @override
//   State<AgregarPermiso> createState() => _AgregarPermisoState();
// }

// class _AgregarPermisoState extends State<AgregarPermiso> {
//   final TextEditingController descripcion = TextEditingController();

//   final TextEditingController fecha = TextEditingController();

//   final TextEditingController motivo = TextEditingController();

//   final ref = FirebaseDatabase.instance.ref();

//   List carreras = ['Desarrollo de software', 'Infraestructura de redes'];

//   List divisiones = ['tic', 'ird'];

//   String carreraF = '';

//   String divisionF = '';

//   String errorName = '';

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Registrar Alumno')),
//       body: SingleChildScrollView(
//           child: Container(
//         padding: const EdgeInsets.all(10),
//         child: Column(children: [
//           TextFormField(
//             decoration: const InputDecoration(labelText: 'Descripcion'),
//             controller: descripcion,
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           TextFormField(
//             decoration: const InputDecoration(labelText: 'Fecha'),
//             controller: fecha,
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           // TextFormField(
//           //   decoration: const InputDecoration(labelText: 'Division'),
//           //   controller: divisionController,
//           // ),
          
          
          
//           TextFormField(
//             decoration: const InputDecoration(labelText: 'Motivo'),
//             controller: motivo,
//           ),
//           const SizedBox(
//             height: 20,
//           ),
          
//           Row(
//             children: [
//               ElevatedButton(
//                   onPressed: () async {
//                     Map<String, String> datos = {
//                       'aprobacionDirector': 'Pendiente',
//                       'aprobacionTutor': 'Pendiente',
//                       'usuario': widget.userData['usuario'],
//                       'Carrera': widget.userData['carrera'],
//                       'motivo': motivo.value.text,
//                       'fecha': fecha.value.text,
//                       'descripcion': descripcion.value.text,
//                     };
//                     print(datos);
//                     DatabaseReference referencia = FirebaseDatabase.instance.ref(
//                         '/treecko/${widget.userData['']}/alumno/$carreraF/${usuarioController.value.text}');

//                     DatabaseReference referenciaUser = FirebaseDatabase.instance
//                         .ref(
//                             '/treecko/usuarios/${usuarioController.value.text}');

//                     Map<String, String> userData = {
//                       'rol': 'alumno',
//                       'division': divisionF,
//                       'carrera': carreraF,
//                       'password': contraController.value.text,
//                     };
//                     // referenciaUser.push().set(userData);
//                     // referencia.push().set(datos);

//                     await referenciaUser.update(userData);
//                     await referencia.update(datos);

//                     Color backgroundcolor =
//                         // ignore: use_build_context_synchronously
//                         Theme.of(context).primaryColorLight;
//                     Get.snackbar("Treecko", "Alumno registrado",
//                         backgroundColor: backgroundcolor);
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AgregarPermiso()));
//                   },
//                   child: const Text('Registrarme')),
//             ],
//           )
//         ]),
//       )),
//     );
//   }
// }
