import 'package:flutter/material.dart';
import 'package:gif_gallery_app/models/gif.dart';
import 'package:gif_gallery_app/services/api.dart';

class HomeEvents {
  State state;
  String term;
  List<Gif> items;
  TextEditingController textController = TextEditingController();

  HomeEvents(this.state);

  loadGifts({Function onDone}) async {
    await fetchGifs().then((values) {
      items = Gif.fillCollection(values["data"]);

      if (onDone != null) {
        onDone();
      }
    });
  }

  Future<Map<String, dynamic>> fetchGifs() async {
    if (term == null || term.isEmpty) {
      return await Api.trending().getData();
    }

    return await Api.search(term).getData();
  }
}
