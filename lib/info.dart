import 'package:flutter/material.dart';

class Contacto extends StatelessWidget {
  const Contacto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Información de los contactos"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 25, 10, 10),
          child: Column(
            children: const [
              Text(
                'Treecko',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              CircleAvatar(
                backgroundColor: Colors.green,
                backgroundImage: AssetImage(
                  'assets/images/foto2.png',
                ),
                radius: 75.0,
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              Text(
                'Desarrolladores: ',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Text(
                'Jenner Alexander Gomez Hernandez (Diseñador)',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Text(
                'Sergio Amaury Montiel Torres (Programador)',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Text(
                'Adal Mendez Jimenez (Tester)',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Text(
                'Andy Garcia Gonzalez',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Text(
                'Bernal Gamboa Barragan',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              Text(
                'contactanos al correo:',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Text(
                'Treecko@gmail.com',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              Icon(Icons.location_on),
              Text(
                'Ubicación:',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Text(
                'Av. Sur Ote Norte Barrio Centro',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0)),
              Text(
                'Ocosingo Chiapas 29950',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
