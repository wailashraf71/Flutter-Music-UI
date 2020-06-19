import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music/ui/screens/sub/music_player.dart';

class MiniPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 2, color: Colors.black.withOpacity(0.05))
      ]),
      height: 63,
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
                itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return MusicPlayer(
                        imageUrl:
                            'https://cdn-images-1.listennotes.com/podcasts/the-garyvee-audio-experience-gary-vaynerchuk-1LhHm5cvl6_-X0Dfm7O_o3y.1400x1400.jpg',
                      );
                    }),
                child: Container(
                  color: Theme.of(context).bottomAppBarColor,
                  height: 65,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 0,
                        child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                placeholder: (context, value) => Image.asset('assets/png/track.png'),
                                imageUrl:
                                    'https://static1.purebreak.com/articles/9/16/85/29/@/655885-camila-cabello-en-pleine-preparation-de-opengraph_1200-2.jpg'),),
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Havana'),
                              Text('Camila Cabello',
                                  style: TextStyle(
                                      fontSize: 12,
                                      height: 1.2,
                                      color: Colors.grey)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.favorite_border,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color),
                              onPressed: () {}),
                          IconButton(icon: Icon(Icons.pause, color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color), onPressed: () {})
                        ],
                      ))
                    ],
                  ),
                ),
              );
            }),
          ),
          Container(
            height: 2,
            color: Color(0xffdedede),
            child: LinearProgressIndicator(
              value: 0.6,
            ),
          ),
        ],
      ),
    );
  }
}
