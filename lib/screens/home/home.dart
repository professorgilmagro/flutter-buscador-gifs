import 'package:flutter/material.dart';
import 'package:gif_gallery_app/components/loading.dart';
import 'package:gif_gallery_app/events/home.dart';
import 'package:gif_gallery_app/screens/home/search.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeEvents homeEvents;
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    this.homeEvents = HomeEvents(this);
    this.homeEvents.loadGifts(onDone: () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildView();
  }

  Widget buildView() {
    if (_loading) {
      return Loading(text: 'carregando...').build();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Buscador de Gifs',
            style: GoogleFonts.acme(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              letterSpacing: 1,
            ),
          ),
          toolbarHeight: 80,
          elevation: 0.1,
          leading: Image.asset(
            'assets/images/logo.png',
            height: 30,
          ),
          backgroundColor: Colors.indigoAccent,
        ),
        body: Container(
          color: Colors.indigo,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Search(controller: homeEvents.textController)
              ]),
        ));
  }
}
