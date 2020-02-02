import 'package:dhruvilp/constants.dart';
import 'package:dhruvilp/layouts/SectionLayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme_handler.dart';
import 'mini_widgets.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {

  Widget moreProjects(){
    return Align(
      alignment: Alignment.topCenter,
      child: FlatButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: (){
          launchURL(GITHUB_REPO_URL);
        },
        label: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0,),
          child: Text('More Projects', style: Theme.of(context).textTheme.subhead,),
        ),
        icon: Icon(Icons.more, color: Theme.of(context).primaryColor,),
        color: Theme.of(context).scaffoldBackgroundColor,
        splashColor: Theme.of(context).scaffoldBackgroundColor,
        hoverColor: Theme.of(context).primaryColorLight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: isWeb(context) ? EdgeInsets.only(bottom: 35.0,) : EdgeInsets.only(top: 40.0, bottom: 40.0, right: 15.0, left: 15.0,),
          children: <Widget>[
            isMobile(context) ? Center(
              child: Text('PROJECTS', style: TextStyle(fontFamily: 'Monoton', fontSize: 50.0, color: Theme.of(context).primaryColorLight, fontWeight: FontWeight.w300,),),
            ) : Container(),
            SectionLayout(
              headlineText: 'FAVORITE',
              child: ProjectCard(demoImage: iTriageDemo, title: iTrTitle, briefDescription: iTrBriefDescription, description: iTrDescription, techStack: iTrTechStack, projectLink: ITRIAGE_URL, achievement: iTrAchievement,),
            ),
            isMobile(context) ? SizedBox(height: 40.0,) : Container(),
            SectionLayout(
              headlineText: 'LONGTERM',
              child: ProjectCard(demoImage: oneappDemo, title: oneappTitle, briefDescription: oneappBriefDescription, description: oneappDescription, techStack: oneappTechStack, projectLink: ONEAPP_URL,),
            ),
            isMobile(context) ? SizedBox(height: 40.0,) : Container(),
            SectionLayout(
              headlineText: '1ST WINNER',
              child: ProjectCard(demoImage: dianoDemo, title: dianoTitle, briefDescription: dianoBriefDescription, description: dianoDescription, techStack: dianoTechStack, projectLink: DIANO_URL, achievement: dianoAchievement,),
            ),
            isMobile(context) ? SizedBox(height: 40.0,) : Container(),
            SectionLayout(
              headlineText: '~',
              child: moreProjects(),
            ),
            isWeb(context) ? SizedBox(height: 50.0,) : SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}