import 'package:dhruvilp/constants.dart';
import 'package:dhruvilp/layouts/SectionLayout.dart';
import 'package:dhruvilp/tabs/work/mini_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme_handler.dart';

class Work extends StatefulWidget {
  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: isWeb(context) ? EdgeInsets.only(bottom: 35.0,) : EdgeInsets.only(top: 40.0, bottom: 40.0, right: 30.0, left: 30.0,),
          children: <Widget>[
            isMobile(context) ? Padding(
              padding: const EdgeInsets.only(bottom: 15.0,),
              child: Center(
                child: Text('EXPERIENCE', style: TextStyle(fontFamily: 'Monoton', fontSize: 50.0, color: Theme.of(context).primaryColorLight, fontWeight: FontWeight.w300,),),
              ),
            ) : Container(),
            SectionLayout(
              headlineText: 'EXPERIENCE',
              child: ExperienceWidget(companyLogo: lcsrLogo, title: ruTitle, company: ruCompany, date: ruDate, description: ruDescription, techStack: lcsrTechStack, webUrl: LCSR_URL,),
            ),
            isMobile(context) ? SizedBox(height: 40.0,) : Container(),
            SectionLayout(
              headlineText: 'LEADERSHIP',
              child: ExperienceWidget(companyLogo: hackRULogo, title: hackRUTitle, company: hackRUCompany, date: hackRUDate, description: hackRUDescription, techStack: hackRUTechStack, webUrl: HACKRU_URL,),
            ),
            isMobile(context) ? SizedBox(height: 40.0,) : Container(),
            SectionLayout(
              headlineText: 'OPPORTUNITY',
              child: ExperienceWidget(companyLogo: jpmcLogo, title: jpmcTitle, company: jpmcCompany, date: jpmcDate, description: jpmcDescription, techStack: jpmcTechStack, webUrl: JPMC_URL,),
            ),
            isMobile(context) ? SizedBox(height: 40.0,) : Container(),
            SectionLayout(
              headlineText: 'CREATIVITY',
              child: ExperienceWidget(companyLogo: odysseyLogo, title: odysseyTitle, company: odysseyCompany, date: odysseyDate, description: odysseyDescription, techStack: odysseyTechStack, webUrl: ODYSSEY_URL,),
            ),
            isWeb(context) ? SizedBox(height: 20.0,) : Container(),
          ],
        ),
      ),
    );
  }
}