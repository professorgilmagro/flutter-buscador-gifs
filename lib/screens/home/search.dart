import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Search({TextEditingController controller, Function onSearchSubmitted}) {
  return Container(
      color: Colors.black87,
      padding: EdgeInsets.all(6),
      child: TextField(
        controller: controller,
        onSubmitted: onSearchSubmitted,
        style: GoogleFonts.acme(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.lightBlueAccent,
          ),
          labelText: "Pesquisar gif",
          labelStyle: GoogleFonts.acme(color: Colors.lightBlueAccent),
        ),
      ));
}
