import 'package:dhruvilp/tabs/contact/Contact.dart';
import 'package:dhruvilp/tabs/contact/mini_widgets.dart';
import 'package:dhruvilp/tabs/hobbies/Hobbies.dart';
import 'package:dhruvilp/tabs/home/Home.dart';
import 'package:dhruvilp/tabs/projects/Projects.dart';
import 'package:dhruvilp/tabs/work/Work.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../constants.dart';
import '../theme_handler.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({Key key, this.themeMode}) : super(key: key);

  final ThemeMode themeMode;
  @override
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> with SingleTickerProviderStateMixin {
  PageController _tabController;
  Color _selectedTabColor;

  Widget decoratedTab(IconData iconData){
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Icon(iconData),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
  }

  void onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeHandler>(context);
    final iconButtonColor = Theme.of(context).scaffoldBackgroundColor;

    BottomAppBar _buildBottomAppBar(BuildContext context) {
      return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Theme.of(context).primaryColor,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home),
                    color: iconButtonColor,
                    onPressed: (){
                      onTap(0);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.work),
                    color: iconButtonColor,
                    onPressed: (){
                      onTap(1);
                    },
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.apps),
                    color: iconButtonColor,
                    onPressed: (){
                      onTap(2);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.local_activity),
                    color: iconButtonColor,
                    onPressed: (){
                      onTap(3);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: <Widget>[
          new PageView(
            controller: _tabController,
            children: <Widget>[
              Home(),
              Work(),
              Projects(),
              Hobbies(),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              padding: EdgeInsets.all(18.0,),
              splashColor: Theme.of(context).primaryColor,
              iconSize: 30.0,
              icon: themeMode.isDarkMode ? Icon(Icons.flash_off, color: white,) : Icon(Icons.flash_on, color: charcoal_light,),
              onPressed: (){
                themeMode.isDarkMode ? themeMode.setDarkMode(false) : themeMode.setDarkMode(true);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          backgroundColor: semi_transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          builder: (BuildContext context) => Container(
            alignment: Alignment.center,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                rawContactCard(context, GITHUB_HANDLE, GITHUB_URL, githubLogo2),
                rawContactCard(context, LINKEDIN_HANDLE, LINKEDIN_URL, linkedInLogo2),
                rawContactCard(context, EMAIL, EMAIL_LINK, emailLogo2),
              ],
            ),
          ),
        ),
        child: Icon(Icons.contacts, color: charcoal,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

}


