import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/ui/screens/sub/content_view.dart';

class AlbumWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final int navId;

  AlbumWidget({
    Key key,
    this.title = "",
    this.subtitle = "",
    this.image = "",
    @required this.navId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => Get.to(ContentView(
        navId: navId,
        image: image,
        title: title,
        squaredImage: true,
      ), id: navId),
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        placeholder: (context, url) => Image.asset('assets/png/cover.png')),
                  )),
            ),
          ),
          Text(title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1.color,
                  fontWeight: FontWeight.bold,
                  height: 2,
                  fontSize: 13)),
          Text(subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1.color.withOpacity(.45),
                  fontWeight: FontWeight.bold,
                  fontSize: 10)),
        ],
      ),
    );
  }
}
