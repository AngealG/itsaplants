// Tus importaciones existentes
// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itsaplant/categorias/cactaceasDeserticas.dart';
import 'package:itsaplant/categorias/cetaceasMunicipio.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';
import 'package:itsaplant/util/menuButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú Principal',
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(39, 43, 45, 1),
      appBar: AppBar(
        title: Text(
          'ITSA Plants',
          style: GoogleFonts.orelegaOne(
            textStyle: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(92, 147, 109, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10, // Espacio horizontal entre los botones
          mainAxisSpacing: 10, // Espacio vertical entre los botones
          childAspectRatio: 2.3 / 2, // Proporción del tamaño de los botones
          children: <Widget>[
            MenuButton(
              title: 'Cactáceas Municipio',
              icon: Icons.water,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CactaceasMunicipio()),
                );
              },
            ),
            MenuButton(
              title: 'Cactáceas Desérticas',
              icon: Icons.water,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cactaceasDeserticas()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _scanQR(context),
        child: Icon(Icons.qr_code_scanner),
        backgroundColor: const Color.fromARGB(92, 147, 109, 1),
      ),
    );
  }

  Future<void> _scanQR(BuildContext context) async {
    try {
      final result = await BarcodeScanner.scan();
      // Aquí manejas el resultado del escaneo, por ejemplo, mostrando un mensaje
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Resultado del escaneo: ${result.rawContent}')),
      );
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Se requiere permiso de cámara para escanear QR')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error desconocido: $e')),
        );
      }
    }
  }
}