// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListItem extends StatelessWidget {
  // Definición de los parámetros
  final String imagePath;
  final String commonName;
  final String scientificName;
  final VoidCallback onTap;

  // Constructor que toma los parámetros
  const CustomListItem({
    super.key,
    required this.imagePath,
    required this.commonName,
    required this.scientificName,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(imagePath), // Uso del parámetro imagePath
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                commonName, // Uso del parámetro commonName
                style: GoogleFonts.orelegaOne(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                scientificName, // Uso del parámetro scientificName
                style: GoogleFonts.orelegaOne(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
