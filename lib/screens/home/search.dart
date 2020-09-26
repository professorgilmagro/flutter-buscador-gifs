import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Search({TextEditingController controller}) {
  return Container(
      color: Colors.black87,
      padding: EdgeInsets.all(6),
      child: TextField(
        controller: controller,
        style: GoogleFonts.acme(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.lightBlueAccent,
          ),
          labelText: "Pesquisar gift",
          labelStyle: GoogleFonts.acme(color: Colors.lightBlueAccent),
        ),
      ));
}
