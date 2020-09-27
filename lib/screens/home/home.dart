import 'package:flutter/material.dart';
import 'package:gif_gallery_app/components/app_bar.dart';
import 'package:gif_gallery_app/components/loading.dart';
import 'package:gif_gallery_app/events/home.dart';
import 'package:gif_gallery_app/screens/home/search.dart';
import 'package:gif_gallery_app/screens/home/table_gifs.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeEvents homeEvents;

  @override
  void initState() {
    super.initState();

    this.homeEvents = HomeEvents(this);
    this.homeEvents.loadGifts();
  }

  @override
  Widget build(BuildContext context) {
    return buildView();
  }

  Widget buildView() {
    if (homeEvents.loading) {
      return Loading(
        text: 'carregando...',
        assetImage: "assets/images/logo.png",
        indicator: false,
      ).build();
    }

    return Scaffold(
        appBar: CustomAppBar(title: 'Buscador de gifs'),
        body: Container(
          color: Colors.black87,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Search(
                onSearchSubmitted: homeEvents.onSearchSubmit,
              ),
              GiftGrid(context,
                  items: homeEvents.items,
                  onGifTap: homeEvents.onGifTap,
                  onLoadMoreTap: homeEvents.onMoreGifTap,
                  isSearch: homeEvents.term.isNotEmpty),
            ],
          ),
        ));
  }
}
