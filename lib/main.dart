import 'package:fl_live_launcher/apps_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Launcher',
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.red,
          accentColor: Colors.red,
        ),
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
              settings: settings,
              builder: (context) {
                switch (settings.name) {
                  case "apps_grid":
                    return AppsGridPage();
                  default:
                    return HomePage();
                }
              });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          child: Center(
            child: IconButton(
              icon: Icon(Icons.apps),
              onPressed: () => Navigator.pushNamed(context, "apps_grid"),
            ),
          ),
        ),
      ),
    );
  }
}
