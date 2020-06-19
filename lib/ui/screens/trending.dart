import 'package:flutter/material.dart';
import 'package:music/ui/components/dummy_data.dart';
import 'package:music/ui/components/widgets/song_widget.dart';
import 'package:easy_localization/easy_localization.dart';
class Trending extends StatefulWidget {
  final int navId;

  const Trending({Key key, this.navId}) : super(key: key);

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.only(top: 25),
              sliver: SliverAppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                title: Text('Trending',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)).tr(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 35),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Hot this week',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontSize: 20)).tr(),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
            SliverPadding(
              padding: EdgeInsets.only(top: 35),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Top pop music',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontSize: 20)).tr(),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
            SliverPadding(
              padding: EdgeInsets.only(top: 35),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Best of all time',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontSize: 20)).tr(),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
    );
  }
}
