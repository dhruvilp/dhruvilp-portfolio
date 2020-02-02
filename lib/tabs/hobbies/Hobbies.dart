import 'package:dhruvilp/constants.dart';
import 'package:dhruvilp/layouts/SectionLayout.dart';
import 'package:dhruvilp/tabs/hobbies/mini_widgets.dart';
import 'package:dhruvilp/theme_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hobbies extends StatefulWidget {
  @override
  _HobbiesState createState() => _HobbiesState();
}

class _HobbiesState extends State<Hobbies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: isWeb(context) ? EdgeInsets.only(bottom: 15.0,) : EdgeInsets.only(top: 15.0, bottom: 40.0, right: 15.0, left: 15.0,),
          children: <Widget>[
            SectionLayout(
              headlineText: 'LOVE TO DO',
              child: Container(
                child: isWeb(context) ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: activityCard(context, 'SoundCloud', SOUNDCLOUD_URL, soundCloudLogo),
                    ),
                    SizedBox(),
                    Expanded(
                      flex: 1,
                      child: activityCard(context, 'Spotify', SPOTIFY_URL, spotifyLogo),
                    ),
                    SizedBox(),
                    Expanded(
                      flex: 1,
                      child: activityCard(context, 'Reverbnation', REVERBNATION_URL, reverbnationLogo),
                    ),
                  ],
                ) : Column(
                  children: <Widget>[
                    SizedBox(height: 20.0,),
                    Center(
                      child: Text('LOVE TO DO', style: TextStyle(fontFamily: 'Monoton', fontSize: 50.0, color: Theme.of(context).primaryColorLight, fontWeight: FontWeight.w300,),),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      width: 250.0,
                      child: activityCard(context, 'SoundCloud', SOUNDCLOUD_URL, soundCloudLogo),
                    ),
                    Container(
                      width: 250.0,
                      child: activityCard(context, 'Spotify', SPOTIFY_URL, spotifyLogo),
                    ),
                    Container(
                      width: 250.0,
                      child: activityCard(context, 'Reverbnation', REVERBNATION_URL, reverbnationLogo),
                    ),
                  ],
                ),
              ),
            ),
            SectionLayout(
              headlineText: 'ARTICLES',
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    activityCard(context, 'Odyssey', ODYSSEY_URL, odysseyLogo2),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50.0,),
          ],
        ),
      ),
    );
  }
}