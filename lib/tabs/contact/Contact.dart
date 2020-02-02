import 'package:dhruvilp/constants.dart';
import 'package:dhruvilp/layouts/SectionLayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mini_widgets.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(bottom: 15.0,),
          children: <Widget>[
            SectionLayout(
              headlineText: 'FEEL FREE!!',
              child: Container(
                padding: const EdgeInsets.only(right: 60.0,),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Center(
                      child: contactImage,
                    ),
                    SizedBox(height: 35.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        contactCard(context, GITHUB_HANDLE, GITHUB_URL, githubLogo),
                        contactCard(context, LINKEDIN_HANDLE, LINKEDIN_URL, linkedInLogo),
                        contactCard(context, EMAIL, EMAIL_LINK, emailLogo),
                      ],
                    ),
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