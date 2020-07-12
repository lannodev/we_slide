import 'package:flutter/material.dart';

import 'basic/basic.dart';
import 'complex/complex.dart';
import 'spotify/spotify.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      title: 'WeSlide Demo',
      debugShowCheckedModeBanner: false,
      //home: Basic(),
      //home: Complex(),
      home: Spotify(),
    );
  }
}
