import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData CustomAppTheme() => ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      accentColor: Colors.indigoAccent,
      hintColor: Colors.white,
      textTheme: TextTheme(
        headline1: GoogleFonts.pompiere(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none),
        headline6: GoogleFonts.pompiere(
            fontSize: 36.0,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.none),
        bodyText2: GoogleFonts.pompiere(
            fontSize: 14.0, decoration: TextDecoration.none),
        bodyText1: GoogleFonts.pompiere(
            fontSize: 14.0, decoration: TextDecoration.none),
      ),
    );

LinearGradient LinearGradientDefault() => LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [Colors.indigo[800], Colors.indigoAccent],
    );

Widget TextTitle(text, {padding, alignCenter}) {
  return Padding(
    padding: padding ?? EdgeInsets.zero,
    child: Text(
      text,
      textAlign: alignCenter ? TextAlign.center : TextAlign.left,
      style: GoogleFonts.acme(fontSize: 30),
    ),
  );
}

Widget TextSubtitle(text, {padding, alignCenter}) {
  return Padding(
    padding: padding ?? EdgeInsets.zero,
    child: Text(
      text,
      textAlign: alignCenter ? TextAlign.center : TextAlign.left,
      style: GoogleFonts.acme(fontSize: 20),
    ),
  );
}
