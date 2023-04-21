import 'package:flutter/material.dart';

import 'model/permiso_modelo.dart';

class PermisoVer extends StatefulWidget {
  final Permiso permiso;
  const PermisoVer({super.key, required this.permiso});

  @override
  State<PermisoVer> createState() => _PermisoVerState();
}

class _PermisoVerState extends State<PermisoVer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información del permiso  ${widget.permiso.nombre}"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 25, 10, 10),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(5.0)),
              Text(
                '${widget.permiso.nombre} ${widget.permiso.apellidos}',
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const Padding(padding: EdgeInsets.all(5.0)),
              Text(
                'Fecha: ${widget.permiso.fecha}',
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              Text(
                'Motivo: ${widget.permiso.motivo}',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              Text(
                'Descripcion: ${widget.permiso.descripcion}',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              const Padding(padding: EdgeInsets.all(5.0)),
              Text(
                'Aprobacion: ${widget.permiso.aprobacion}',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
