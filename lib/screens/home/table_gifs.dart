import 'package:flutter/material.dart';
import 'package:gif_gallery_app/models/gif.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

Widget GiftGrid(context,
    {@required List<Gif> items,
    Function onGifTap,
    bool isSearch,
    Function onLoadMoreTap}) {
  return Expanded(
      child: GridView.builder(
    padding: EdgeInsets.all(10),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemCount: isSearch ? items.length + 1 : items.length,
    itemBuilder: (context, index) {
      if (isSearch && index == items.length) {
        return Container(
            color: Colors.indigo,
            child: GestureDetector(
                onTap: onLoadMoreTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Divider(
                      color: Colors.indigo,
                    ),
                    Text(
                      'Ver mais...',
                      style: GoogleFonts.acme(fontSize: 16),
                    )
                  ],
                )));
      }

      return GestureDetector(
          onTap: () => onGifTap(items[index]),
          onLongPress: () {
            Share.share(items[index].url);
          },
          child: FadeInImage.assetNetwork(
              placeholder: "assets/images/loading.gif",
              placeholderCacheHeight: 300,
              image: items[index].url,
              height: 300,
              fit: BoxFit.cover));
    },
  ));
}
