import 'package:dhruvilp/tabs/home/Home.dart';
import 'package:dhruvilp/theme_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';
import 'constants.dart';
import 'layouts/MobileLayout.dart';
import 'layouts/WebLayout.dart';

void main() => runApp(MyPortfolio());

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (!snapshot.hasData) {
          return _SplashScreen();
        }
        return ChangeNotifierProvider<ThemeHandler>.value(
          value: ThemeHandler(snapshot.data),
          child: _MyPortfolio(),
        );
      },
    );
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: white,
      child: Center(child: appIcon),
    );
  }
}

class _MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DhruVil Patel | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeHandler>(context).isDarkMode
          ? kDarkTheme
          : kLightTheme,
      darkTheme: kDarkTheme,
      routes: <String, WidgetBuilder> {
        '/home': (BuildContext context) => new Home(),
      },
      home: ResponsiveWebPage(),
    );
  }
}

/// Responsive Layout Builder
/// --------------------------------------------

class ResponsiveWebPage extends StatelessWidget {
  ResponsiveWebPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return (constraints.maxWidth <= 845)
            ? MobileLayout()
            : WebLayout();
      }
    );
  }
}
