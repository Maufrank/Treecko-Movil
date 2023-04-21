// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movil/consulta_permisos.dart';
import 'package:movil/model/permiso_modelo.dart';
import 'package:movil/model/usuario_modelo.dart';
import 'package:movil/notification_services.dart';

import 'consulta_permiso_tuto.dart';
import 'consulta_permiso_tutor.dart';
import 'consultar_usuario.dart';
import 'form_registrar_alumno.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ref = FirebaseDatabase.instance.ref();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Inicia sesión',
                    style: TextStyle(fontSize: 50),
                  )),
              Center(),
              Image.asset(
                'assets/images/foto.png',
                width: 98,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usuario',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Contraseña',
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Ingresar'),
                  onPressed: () async {
                    String usuario = nameController.value.text;
                    String pass = passwordController.value.text;
                    final snapshot = await ref
                        .child('treecko/usuarios/$usuario/password')
                        .get();
                    // print(snapshot.value);

                    final use =
                        await ref.child('treecko/usuarios/$usuario').get();
                    try {
                      Map user = use.value as Map;

                      // print(user['division']);

                      // print(snapshot.value);

                      if (snapshot.exists) {
                        if (user['password'] == pass) {
                          if (user['rol'] == 'alumno') {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FetchData(
                                          usuario: usuario,
                                          userData: user,
                                        )));
                            try {
                              final use = await ref
                                  .child(
                                      'treecko/usuarios/$usuario/notificaciones')
                                  .get();
                              print(use);
                              Map notificaciones = use.value as Map;
                              notificaciones.forEach(
                                (key, value) {
                                  mostrarNotificacion(value);
                                  // print()
                                },
                              );
                              print(notificaciones);
                            } catch (e) {
                              print(e);
                            }
                          } else if (user['rol'] == 'tutor') {
                            List<Permiso> listPermisos = [];
                            final alumnos = await ref
                                .child(
                                    'treecko/${user['division']}/alumno/${user['carrera']}')
                                .get();
                            final Map alumno = alumnos.value as Map;
                            alumno.forEach(
                              (key, value) {
                                Map infoAl = alumno[key];
                                Map permisos = infoAl['permisos'] as Map;
                                permisos.forEach((key, value) {
                                  try {
                                    // print(permisos[key]);
                                    Map per = permisos[key];
                                    Permiso permiso = Permiso(
                                        per['aprobacionTutor'],
                                        per['descripcion'],
                                        per['fecha'],
                                        per['motivo'],
                                        infoAl['nombre'],
                                        infoAl['apellidos']);
                                    listPermisos.add(permiso);
                                  } catch (e) {
                                    print(e);
                                  }
                                });
                                // print(infoAl['permisos']);
                              },
                            );
                            print(listPermisos[1].nombre);

                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PermisoVistaT(
                                          listPermisos: listPermisos,
                                        )));
                          } else if (user['rol'] == 'director') {
                            List<Permiso> permisos = [];
                            final alumnos = await ref
                                .child('treecko/${user['division']}/alumno')
                                .get();
                            Map alumnosMap = alumnos.value as Map;
                            // print(alumnosMap);
                            alumnosMap.forEach((key, value) {
                              Map carreras = alumnosMap[key];

                              // print(carreras);
                              carreras.forEach((key, value) {
                                Map alumnosInfo = carreras[key];
                                try {
                                  Map permiso = alumnosInfo['permisos'];

                                  permiso.forEach(
                                    (key, value) {
                                      Map permisoInfo = permiso[key] as Map;
                                      permisos.add(Permiso(
                                          permisoInfo['aprobacionTutor'],
                                          permisoInfo['descripcion'],
                                          permisoInfo['fecha'],
                                          permisoInfo['motivo'],
                                          alumnosInfo['nombre'],
                                          alumnosInfo['apellidos']));
                                    },
                                  );
                                } catch (e) {
                                  print(e);
                                }
                              });
                            });
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PermisoVistaT(
                                          listPermisos: permisos,
                                        )));
                          } else if (user['rol'] == 'administrador') {
                            List<Usuario> listUsers = [];
                            print('Hola');
                            final users =
                                await ref.child('treecko/usuarios').get();

                            Map usuarios = users.value as Map;
                            usuarios.forEach((key, value) {
                              Map datos = value as Map;
                              print(datos);
                              listUsers.add(Usuario(
                                  datos['division'], datos['rol'], key));
                            });
                            // ignore: use_build_context_synchronously
                            // print(user.values);
                            print(user['notificaciones']);
                            try {
                              Map noti = user['notificaciones'] as Map;
                              noti.forEach(
                                (key, value) {
                                  mostrarNotificacion(value);
                                },
                              );
                            } catch (e) {
                              print(e);
                            }

                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UsuariosVistaT(
                                          listUsuario: listUsers,
                                        )));
                          } else if (user['rol'] == 'administrador') {
                            List<Usuario> listUsers = [];
                            print('Hola');
                            final users =
                                await ref.child('treecko/usuarios').get();

                            Map usuarios = users.value as Map;
                            usuarios.forEach((key, value) {
                              Map datos = value as Map;
                              print(datos);
                              listUsers.add(Usuario(
                                  datos['division'], datos['rol'], key));
                            });
                            // ignore: use_build_context_synchronously
                            // print(user.values);
                            print(user['notificaciones']);
                            try {
                              Map noti = user['notificaciones'] as Map;
                              noti.forEach(
                                (key, value) {
                                  mostrarNotificacion(value);
                                },
                              );
                            } catch (e) {
                              print(e);
                            }

                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UsuariosVistaT(
                                          listUsuario: listUsers,
                                        )));
                          }

                          // Get.offNamed('/home');
                        } else {
                          Color backgroundcolor =
                              // ignore: use_build_context_synchronously
                              Theme.of(context).primaryColorLight;
                          Get.snackbar("Treecko", "Tu contraseña es incorrecta",
                              backgroundColor: backgroundcolor);
                        }
                      } else {
                        Color backgroundcolor =
                            // ignore: use_build_context_synchronously
                            Theme.of(context).primaryColorLight;
                        Get.snackbar("Treecko", "El usuario no existe",
                            backgroundColor: backgroundcolor);

                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }
                    } catch (e) {
                      print(e);
                      Color backgroundcolor =
                          // ignore: use_build_context_synchronously
                          Theme.of(context).primaryColorLight;
                      Get.snackbar("Treecko", "Error de inicio",
                          backgroundColor: backgroundcolor);

                      // ignore: use_build_context_synchronously
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => AgregarAlumno()));

                      // ignore: use_build_context_synchronously
                    }
                    // if (usuario == 'MauMau' && pass == 'maumau') {
                    //   // Get.offNamed('/home');
                    //   Get.offNamed('/home');
                    // } else {
                    //   Color backgroundcolor =
                    //       Theme.of(context).primaryColorLight;
                    //   Get.snackbar("Task", "Datos incorrectos",
                    //       backgroundColor: backgroundcolor);
                    // }
                  },
                ),
              ),
            ],
          )),
    );
  }
}
