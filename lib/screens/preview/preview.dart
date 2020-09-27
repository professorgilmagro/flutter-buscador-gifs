import 'package:flutter/material.dart';
import 'package:gif_gallery_app/components/app_bar.dart';
import 'package:gif_gallery_app/models/gif.dart';
import 'package:gif_gallery_app/theme/style.dart';
import 'package:share/share.dart';

class Preview extends StatelessWidget {
  final Gif _gif;

  Preview(this._gif);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Preview",
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            iconSize: 30,
            onPressed: () {
              Share.share(_gif.url);
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradientDefault()),
        child: Column(children: [
          TextTitle(_gif.title,
              alignCenter: true, padding: EdgeInsets.only(bottom: 30, top: 30)),
          FadeInImage.assetNetwork(
            placeholder: "assets/images/loading.gif",
            placeholderCacheHeight: 300,
            image: _gif.url,
            height: 400,
            fit: BoxFit.cover,
          ),
          TextSubtitle(_gif.slug,
              alignCenter: true, padding: EdgeInsets.only(bottom: 30, top: 30))
        ]),
      ),
    );
  }
}
