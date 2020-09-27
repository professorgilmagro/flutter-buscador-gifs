import 'package:flutter/material.dart';
import 'package:gif_gallery_app/models/gif.dart';
import 'package:gif_gallery_app/screens/preview/preview.dart';
import 'package:gif_gallery_app/services/api.dart';

class HomeEvents {
  State state;
  String term = '';
  bool loading = true;
  int offset = 0;
  List<Gif> items;

  HomeEvents(this.state);

  onGifTap(Gif gif) {
    Navigator.push(
        state.context, MaterialPageRoute(builder: (context) => Preview(gif)));
  }

  onMoreGifTap() {
    this.offset += Api.LIMIT;
    state.setState(() {
      this.loadGifts();
    });
  }

  onSearchSubmit(String value) {
    if (value.isNotEmpty) {
      this.term = value;
      this.loadGifts();
    }
  }

  loadGifts({Function onDone}) async {
    initLoading();
    await fetchGifs().then((values) {
      items = Gif.fillCollection(values["data"]);
      endLoading();
      if (onDone != null) {
        onDone();
      }
    });
  }

  void initLoading() {
    state.setState(() {
      this.loading = true;
    });
  }

  void endLoading() {
    state.setState(() {
      this.loading = false;
    });
  }

  Future<Map<String, dynamic>> fetchGifs() async {
    if (term == null || term.isEmpty) {
      return await Api.trending(offset: offset).getData();
    }

    return await Api.search(term, offset: offset).getData();
  }
}
