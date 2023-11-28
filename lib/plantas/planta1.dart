import 'package:flutter/material.dart';

class Planta extends StatelessWidget {
  final String titulo;
  final String imagePath;
  final String description;

  const Planta(
      {super.key,
      required this.titulo,
      required this.imagePath,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(titulo),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          _plantaImagen(imagePath),
          Expanded(
            child: SingleChildScrollView(
              child: _seccionTexto(description),
            ),
          ),
        ],
      ),
    );
  }

  Widget _plantaImagen(String imagePath) {
    return Container(
      width: double.infinity, // Ocupa todo el ancho disponible
      height: 250,
      child: Image.asset(
        imagePath,
        fit: BoxFit
            .cover, // Cubre todo el ancho manteniendo la proporción de la imagen
      ),
    );
  }

  Widget _seccionTexto(String description) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}
