import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Settings extends StatefulWidget {
  final int navId;

  const Settings({Key key, this.navId}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                title: Text('Settings',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)).tr(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              sliver: SliverToBoxAdapter(
                child: Text('Account',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)).tr(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              sliver: SliverToBoxAdapter(
                  child: CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: 65,
                            height: 65,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://images.unsplash.com/photo-1542103749-8ef59b94f47e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                              fit: BoxFit.cover,
                              placeholder: (context, value) =>
                                  Image.asset('assets/png/user.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Tae Ebison',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )).tr(),
                            Text('hello@example.com',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color
                                        .withOpacity(0.46),
                                    fontSize: 12,
                                    height: 1.5)),
                          ],
                        )
                      ],
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 26,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.78),
                    )
                  ],
                ),
              )),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              sliver: SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Offline mode',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )).tr(),
                        Text('Only downloaded content will be available',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color
                                    .withOpacity(0.24),
                                fontSize: 12,
                                height: 1.5)).tr(),
                      ],
                    ),
                    Switch(value: true, onChanged: (value) {})
                  ],
                ),
              )),
            ),
            SliverPadding(
              padding: EdgeInsets.all(30),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverToBoxAdapter(
                child: Text('Connect with us',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)).tr(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              sliver: SliverToBoxAdapter(
                  child: CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('About us',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )).tr(),
                        Text('Get to know more about the app',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color
                                    .withOpacity(0.24),
                                fontSize: 12,
                                height: 1.5)).tr(),
                      ],
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 26,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.78),
                    )
                  ],
                ),
              )),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              sliver: SliverToBoxAdapter(
                  child: CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Terms & Conditions',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )).tr(),
                        Text(
                            'Read our terms and conditions of how to use the app',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color
                                    .withOpacity(0.24),
                                fontSize: 12,
                                height: 1.5)).tr(),
                      ],
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 26,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.78),
                    )
                  ],
                ),
              )),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              sliver: SliverToBoxAdapter(
                  child: CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Follow us on Instagram',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            )).tr(),
                        Text(
                            'Be in touch with us on social media',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .color
                                    .withOpacity(0.24),
                                fontSize: 12,
                                height: 1.5)).tr(),
                      ],
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 26,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .color
                          .withOpacity(0.78),
                    )
                  ],
                ),
              )),
            ),
            SliverPadding(
                padding: EdgeInsets.all(75),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: Text('Version 1.0.0',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .color
                                .withOpacity(.3))),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
