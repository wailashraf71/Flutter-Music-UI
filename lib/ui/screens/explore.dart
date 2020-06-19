import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music/ui/components/dummy_data.dart';
import 'package:music/ui/components/widgets/album_widget.dart';
import 'package:music/ui/components/widgets/artist_widget.dart';
import 'package:music/ui/components/widgets/genre_widget.dart';
import 'package:music/ui/components/widgets/song_widget.dart';
import 'package:easy_localization/easy_localization.dart'
    '';
class Explore extends StatefulWidget {
  final int navId;

  const Explore({Key key, this.navId}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.only(top: 25),
              sliver: SliverAppBar(
                brightness: Brightness.light,
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                title: Text('Explore',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)).tr(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 20),
              sliver: SliverToBoxAdapter(
                child: buildRecentlyPlayed(context),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 20),
              sliver: SliverToBoxAdapter(
                child: buildRecommended(context),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 20),
              sliver: SliverToBoxAdapter(
                child: buildGenres(context),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 20),
              sliver: SliverToBoxAdapter(
                child: buildTopArtists(context),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 20),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text('For you',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontSize: 22)).tr(),
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

  ///Widgets
  Container buildRecentlyPlayed(BuildContext context) {
    return Container(
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              child: Text('Recently played',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontSize: 22)).tr()),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: albums.length,
                padding: EdgeInsets.symmetric(horizontal: 15),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 15);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Hero(
                    tag: albums[index]['image'],
                    child: AlbumWidget(
                      title: albums[index]['title'],
                      subtitle: albums[index]['subtitle'],
                      image: albums[index]['image'],
                      navId: widget.navId,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Container buildRecommended(BuildContext context) {
    return Container(
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              child: Text('Recommended',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontSize: 22)).tr()),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: albums2.length,
                padding: EdgeInsets.symmetric(horizontal: 15),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 15);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Hero(
                    tag: albums2[index]['image'],
                    child: AlbumWidget(
                      title: albums2[index]['title'],
                      subtitle: albums2[index]['subtitle'],
                      image: albums2[index]['image'],
                      navId: widget.navId,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Container buildGenres(BuildContext context) {
    return Container(
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              child: Text('Genres & Moods',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontSize: 22)).tr()),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: genres.length,
                padding: EdgeInsets.symmetric(horizontal: 15),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 15);
                },
                itemBuilder: (BuildContext context, int index) {
                  return GenreWidget(
                    title: genres[index]['title'],
                    image: genres[index]['image'],
                    navId: widget.navId,
                  );
                }),
          ),
        ],
      ),
    );
  }

  Container buildTopArtists(BuildContext context) {
    return Container(
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              child: Text('Top Artists',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontSize: 22)).tr()),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: artists.length,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 15);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Hero(
                      tag: artists[index]['image'],
                      child: ArtistWidget(
                        title: artists[index]['title'],
                        image: artists[index]['image'],
                        navId: widget.navId,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

}
