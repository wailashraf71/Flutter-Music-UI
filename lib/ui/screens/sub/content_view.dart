import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music/ui/components/dummy_data.dart';
import 'package:music/ui/components/widgets/song_widget.dart';
import 'package:sliver_fab/sliver_fab.dart';

class ContentView extends StatefulWidget {
  final String title;
  final String image;
  final bool squaredImage;
  final int navId;

  const ContentView(
      {Key key, this.title, this.image, this.navId, this.squaredImage = false})
      : super(key: key);

  @override
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView>
    with SingleTickerProviderStateMixin {
  double top = 400;
  AnimationController _animationController;
  Animation _colorTween;

  @override
  void didChangeDependencies() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _colorTween = ColorTween(begin: Colors.black, end: Colors.white)
        .animate(_animationController);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: new Builder(
          builder: (context) => new SliverFab(
            floatingWidget: FloatingActionButton(
              onPressed: () {
                ///Todo: Play music from this list
              },
              child: Icon(Icons.play_arrow),
            ),
            floatingPosition: FloatingPosition(right: 12),
            expandedHeight: widget.squaredImage ? 400.0 : 256.0,
            slivers: <Widget>[
              SliverAppBar(
                  expandedHeight: widget.squaredImage ? 400.0 : 256.0,
                  pinned: true,
                  elevation: 0.4,
                  leading: AnimatedBuilder(
                    builder: (context, child) => IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                      color: _colorTween.value.withOpacity(.8),
                    ),
                    animation: _colorTween,
                  ),
                  backgroundColor: Theme.of(context).bottomAppBarColor,
                  flexibleSpace: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    top = constraints.biggest.height;
                    if (top <= 110) {
                      _animationController.reverse();
                    } else {
                      _animationController.forward();
                    }
                    return FlexibleSpaceBar(
                      title: AnimatedBuilder(
                        builder: (context, child) => Text(widget.title,
                            style: TextStyle(
                                color: _colorTween.value,
                                fontWeight: FontWeight.bold,
                                height: 0.8)),
                        animation: _colorTween,
                      ),
                      background: Hero(
                        tag: widget.image,
                        child: CachedNetworkImage(
                          imageUrl: widget.image,
                          fit: BoxFit.cover,
                          color: Colors.black12,
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                    );
                  })),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    List.generate(
                      songs.length,
                      (int index) => Container(
                        height: 80,
                        child: SongWidget(
                            title: songs[index]['title'],
                            subtitle: songs[index]['subtitle'],
                            image: songs[index]['image']),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
