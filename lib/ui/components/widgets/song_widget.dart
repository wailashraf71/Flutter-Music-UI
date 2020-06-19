import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final bool liked;

  SongWidget({
    Key key,
    this.title = "",
    this.subtitle,
    this.image = "",
    this.liked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        onPressed: () {
          ///Todo: Change state of MiniPlayer in App.dart to show/hide and change the color of this widget's title to accent color
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Play music in MiniPlayer')));
        },
        padding: EdgeInsets.zero,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(0))),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(0)),
                            child: CachedNetworkImage(
                                imageUrl: image,
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                                placeholder: (context, url) => Image.asset(
                                      'assets/png/track.png',
                                      fit: BoxFit.cover,
                                    )),
                          ))),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                            subtitle != null
                                ? Text(subtitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .color
                                            .withOpacity(0.5),
                                        height: 1.5,
                                        fontSize: 9))
                                : Container(),
                          ],
                        )),
                      ])),
                  IconButton(
                    icon: Icon(liked ? Icons.favorite : Icons.favorite_border),
                    onPressed: () {},
                    color: liked
                        ? Theme.of(context).accentColor.withOpacity(.9)
                        : Theme.of(context)
                            .textTheme
                            .bodyText1
                            .color
                            .withOpacity(.2),
                  )
                ])));
  }
}
