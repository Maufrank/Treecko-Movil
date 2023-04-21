import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movil/info.dart';
import 'package:movil/login.dart';
import 'package:movil/notification_services.dart';
import 'consulta_permisos.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import 'form_registrar_alumno.dart';

Future<void> main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // FirebaseDatabase database = FirebaseDatabase.instance;
  WidgetsFlutterBinding.ensureInitialized();
  await initNotifications();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Treecko',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: '/login',
        getPages: [
          GetPage(name: '/login', page: () => LoginScreen()),
          // GetPage(name: '/home', page: () => FetchData()),
          GetPage(name: '/info', page: () => const Contacto()),
          GetPage(name: '/agregar', page: () => AgregarAlumno()),
        ]);
  }
}
