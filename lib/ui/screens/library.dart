import 'package:flutter/material.dart';
import 'package:music/ui/components/dummy_data.dart';
import 'package:music/ui/components/widgets/song_widget.dart';

class Library extends StatefulWidget {
  final int navId;

  const Library({Key key, this.navId}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, value) {
              return [
                SliverPadding(
                  padding: EdgeInsets.only(top: 25),
                  sliver: SliverAppBar(
                    elevation: 0.0,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    title: Text('Library',
                        style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SliverAppBar(
                  pinned: true,
                  elevation: 0.0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  bottom: PreferredSize(
                    preferredSize: Size.zero,
                    child: Container(
                      width: double.infinity,
                      child: TabBar(
                          controller: tabController,
                          labelColor: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color
                              .withOpacity(.9),
                          unselectedLabelColor: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color
                              .withOpacity(.37),
                          labelPadding: EdgeInsets.symmetric(horizontal: 15),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                              width: 4,
                            ),
                          ),
                          isScrollable: true,
                          tabs: [
                            Tab(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text('Favorites'),
                              ),
                            ),
                            Tab(
                              child: Text('Recently Played'),
                            ),
                          ]),
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(controller: tabController, children: [
              buildSongsList(liked: true),
              buildSongsList(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildSongsList({bool liked = false}) {
    return ListView.builder(
        itemCount: songs.length,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 80,
              child: SongWidget(
                  title: songs[index]['title'],
                  subtitle: songs[index]['subtitle'],
                  image: songs[index]['image'],
                  liked: liked));
        });
  }
}
