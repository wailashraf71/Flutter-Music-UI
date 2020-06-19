import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/ui/components/dummy_data.dart';
import 'package:music/ui/components/widgets/genre_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class Search extends StatefulWidget {
  final int navId;

  const Search({Key key, this.navId}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 25),
            sliver: SliverAppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              title: Text('Search',
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)).tr(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverToBoxAdapter(
              child: _buildSearchBar(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 35),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text('All Genres',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 20)).tr(),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return GenreWidget(
                  image: genres[index]['image'],
                  title: genres[index]['title'],
                  navId: widget.navId,
                );
              }, childCount: genres.length),
            ),
          ),
        ],
      )),
    );
  }

  ///Widgets
  Widget _buildSearchBar() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: CupertinoButton(
        onPressed: () {
          /// Todo: Implement search
        },
        padding: EdgeInsets.zero,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          height: 50.0,
          color: Theme.of(context).textTheme.bodyText1.color.withOpacity(.03),
          child: Center(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.search,
                    color: Theme.of(context).textTheme.bodyText1.color,
                    size: 20.0,
                  ),
                ),
                Expanded(
                    child: Text(
                  'Search for songs, artists ...',
                  style: TextStyle(
                    fontSize: 15,
                      color: Theme.of(context).textTheme.bodyText1.color.withOpacity(.42)),
                ).tr())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
