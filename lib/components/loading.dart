import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loading {
  String text;
  Widget indicator;

  Loading({this.text, this.indicator});

  Widget build() {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: getContent()));
  }

  List<Widget> getContent() {
    List<Widget> items = [];
    items.add(indicator ?? _getDefaultIndicator());
    if (text != null && text.isNotEmpty) {
      items.add(_getTextContent());
    }

    return items;
  }

  Widget _getDefaultIndicator() => Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );

  Widget _getTextContent() => Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        this.text,
        style: GoogleFonts.pompiere(fontSize: 18, color: Colors.white, decoration: TextDecoration.none),
        textAlign: TextAlign.center,
      ));
}
