import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

import '../colors.dart';
import '../theme_handler.dart';
import 'package:dhruvilp/tabs/home/Home.dart';
import 'package:dhruvilp/tabs/work/Work.dart';
import 'package:dhruvilp/tabs/projects/Projects.dart';
import 'package:dhruvilp/tabs/hobbies/Hobbies.dart';
import 'package:dhruvilp/tabs/contact/Contact.dart';

class WebLayout extends StatefulWidget {
  const WebLayout({Key key, this.themeMode}) : super(key: key);

  final ThemeMode themeMode;
  @override
  _WebLayoutState createState() => _WebLayoutState();
}

class _WebLayoutState extends State<WebLayout> with SingleTickerProviderStateMixin {
  TabController _tabController;

  Widget decoratedTab(String text){
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: (MediaQuery.of(context).size.width <= 1000) ? 20.0 :24.0,
              fontWeight: FontWeight.w100,
            ),
            maxLines: 1,
            semanticsLabel: text,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeHandler>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: <Widget>[
          TabBarView(
            children: [
              Home(),
              Work(),
              Projects(),
              Hobbies(),
              Contact(),
            ],
            controller: _tabController,
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              padding: EdgeInsets.only(right: 18.0, top: 18.0,),
              splashColor: white,
              iconSize: 30.0,
              icon: themeMode.isDarkMode ? Icon(Icons.flash_off, color: white,) : Icon(Icons.flash_on, color: charcoal_light,),
              onPressed: (){
                themeMode.isDarkMode ? themeMode.setDarkMode(false) : themeMode.setDarkMode(true);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        height: 57.0,
        width: MediaQuery.of(context).size.width / 1.5,
        child: TabBar(
          tabs: [
            decoratedTab('Home'),
            decoratedTab('Work'),
            decoratedTab('Projects'),
            decoratedTab('Hobbies'),
            decoratedTab('Contact'),
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Theme.of(context).primaryColor,
          indicatorWeight: 2.0,
          unselectedLabelColor: Theme.of(context).primaryColor,
          unselectedLabelStyle: Theme.of(context).textTheme.body1,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
