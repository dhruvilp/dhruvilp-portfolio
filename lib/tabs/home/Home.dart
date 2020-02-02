import 'package:dhruvilp/constants.dart';
import 'package:dhruvilp/layouts/SectionLayout.dart';
import 'package:dhruvilp/tabs/home/mini_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../theme_handler.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: isWeb(context) ? EdgeInsets.only(bottom: 35.0,) : EdgeInsets.only(top: 40.0, bottom: 40.0, right: 30.0, left: 30.0,),
          children: <Widget>[
            isMobile(context) ? SizedBox(height: 65.0,) : Container(),
            SectionLayout(
              headlineText: 'INQUISITIVE',
              child: _introSection(context),
            ),
            isMobile(context) ? SizedBox(height: 40.0,) : Container(),
            SectionLayout(
              headlineText: 'ABOUT ME',
              child: _aboutSection(context),
            ),
            isMobile(context) ? SizedBox(height: 40.0,) : Container(),
            isMobile(context) ? Padding(
              padding: const EdgeInsets.only(bottom: 40.0,),
              child: Center(
                child: Text('EDUCATION', style: TextStyle(fontFamily: 'Monoton', fontSize: 50.0, color: Theme.of(context).primaryColorLight, fontWeight: FontWeight.w300,),),
              ),
            ) : Container(),
            SectionLayout(
              headlineText: 'EDUCATION',
              child: _educationSection(context),
            ),
            SizedBox(height: 40.0,),
          ],
        ),
      ),
    );
  }


///----------------------------------
///            SECTIONS
///----------------------------------

  Widget _introSection(BuildContext context){
    return Container(
      child: isWeb(context) ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: profileImage(context),
          ),
          Container(width: 50.0,),
          Expanded(
            flex: 3,
            child: briefIntroTexts(context),
          ),
        ],
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          profileImage(context),
          SizedBox(height: 25.0,),
          briefIntroTexts(context),
        ],
      ),
    );
  }

  Widget _aboutSection(BuildContext context){
    return Container(
      child: isWeb(context) ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: aboutMeTexts(context),
          ),
          Container(width: 50.0,),
          Expanded(
            flex: 2,
            child: worldMapImage(context),
          ),
        ],
      ) : Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          worldMapImage(context),
          aboutMeTexts(context),
        ],
      ),
    );
  }

  Widget _educationSection(BuildContext context){
    return Column(
      children: <Widget>[
        educationCard(context, schoolName1, schoolMajor1, schoolGradDate1, ruShieldLogo, activitiesAndAchievements1,ruCourseWorks),
        SizedBox(height: isWeb(context) ? 14.0 : 30.0,),
        educationCard(context, schoolName2, schoolMajor2, schoolGradDate2, jpsLogo, activitiesAndAchievements2,jpCourseWorks),
      ],
    );
  }

}
