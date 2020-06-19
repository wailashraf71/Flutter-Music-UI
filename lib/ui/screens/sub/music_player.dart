import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicPlayer extends StatefulWidget {
  final String imageUrl;

  const MusicPlayer({Key key, this.imageUrl}) : super(key: key);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer>
    with SingleTickerProviderStateMixin {
  double sliderValue = 37.0;

  //Controls
  bool play = true;

  AnimationController playButtonAnimationController;

  @override
  void initState() {
    playButtonAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              playerInfo(),
              playerImage(),
              Column(
                children: <Widget>[
                  playerTitle(),
                  playerSlider(),
                  playerControls(),
                  playerOptions(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container playerImage() {
    return Container(
                padding: const EdgeInsets.all(35),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.21),
                        blurRadius: 20,
                      )
                    ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: CachedNetworkImage(
                          imageUrl: widget.imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Image.asset('assets/png/cover.png', fit: BoxFit.cover,)),
                    ),
                  ),
                ));
  }

  ///Widgets
  Widget playerInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(.7),
                  size: 30,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              Text(
                'NOW PLAYING FROM',
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  size: 30,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .color
                      .withOpacity(.7),
                ),
                onPressed: () {},
              ),
            ],
          ),
          Text(
            'Indigo',
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Theme.of(context).accentColor.withOpacity(.8),
                fontWeight: FontWeight.bold,
                fontSize: 18,
                height: 1.5),
          )
        ],
      ),
    );
  }

  Widget playerTitle() {
    return Column(
      children: <Widget>[
        Text(
          'No Guidance',
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Text(
          'Chris Brown feat. Drake',
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color:
                  Theme.of(context).textTheme.bodyText1.color.withOpacity(0.36),
              fontWeight: FontWeight.bold,
              fontSize: 18,
              height: 1.5),
        )
      ],
    );
  }

  Widget playerSlider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          SliderTheme(
            data: SliderThemeData(
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7),
              trackHeight: 5,
            ),
            child: Slider(
              min: 0,
              max: 100,
              value: sliderValue,
              onChanged: (double value) {
                setState(() {
                  sliderValue = value;
                });
              },
              activeColor: Theme.of(context).accentColor.withOpacity(.85),
              inactiveColor: Theme.of(context).accentColor.withOpacity(.09),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '06:15',
                  style: TextStyle(
                      color: Theme.of(context).accentColor.withOpacity(.7),
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '21:38',
                  style: TextStyle(
                      color: Theme.of(context).accentColor.withOpacity(.7),
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget playerControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.replay_30,
              ),
              iconSize: 25,
              onPressed: () {}),
          IconButton(
            icon: Icon(
              Icons.fast_rewind,
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
            iconSize: 40,
            onPressed: () {},
          ),
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor.withOpacity(.85),
                shape: BoxShape.circle),
            child: IconButton(
                icon: AnimatedIcon(
                  icon: AnimatedIcons.pause_play,
                  progress: playButtonAnimationController,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    play
                        ? playButtonAnimationController.forward()
                        : playButtonAnimationController.reverse();
                    play = !play;
                  });
                }),
          ),
          IconButton(
            icon: Icon(
              Icons.fast_forward,
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
            iconSize: 40,
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(
                Icons.forward_30,
              ),
              iconSize: 25,
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget playerOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).accentColor.withOpacity(.8),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shuffle,
              color: Theme.of(context).accentColor.withOpacity(.8),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.repeat,
              color: Theme.of(context).textTheme.bodyText1.color.withOpacity(.4),
            ),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(
                Icons.queue_music,
                color:
                    Theme.of(context).textTheme.bodyText1.color.withOpacity(.4),
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
