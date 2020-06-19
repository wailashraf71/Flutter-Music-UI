import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/ui/screens/sub/content_view.dart';

class GenreWidget extends StatelessWidget {
  final String title;
  final String image;
  final int navId;

  GenreWidget({
    Key key,
    this.title = "",
    this.image = "",
    @required this.navId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => Get.to(
          ContentView(
            image: image,
            title: title,
            navId: navId,
            squaredImage: true,
          ),
          id: navId,
        transition: Transition.rightToLeftWithFade
      ),
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: AspectRatio(
          aspectRatio: 1/1,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(.32), BlendMode.darken),
                    image: CachedNetworkImageProvider(image),
                    fit: BoxFit.cover)),
            child: Center(
              child: Text(title.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}
