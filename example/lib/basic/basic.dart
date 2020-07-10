import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';

class Basic extends StatefulWidget {
  Basic({Key key}) : super(key: key);

  @override
  _BasicState createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    final double _panelMinSize = 70.0;
    final double _panelMaxSize = MediaQuery.of(context).size.height / 2;
    return Scaffold(
      backgroundColor: Colors.black,
      body: WeSlide(
        panelMinSize: _panelMinSize,
        panelMaxSize: _panelMaxSize,
        panelBackground: _colorScheme.background,
        panelBorderRadiusBegin: 12.0,
        panelBorderRadiusEnd: 12.0,
        body: Container(
          color: _colorScheme.background,
          child: Center(child: Text("This is the body 💪")),
        ),
        panel: Container(
          color: _colorScheme.primary,
          child: Center(child: Text("This is the panel 😊")),
        ),
        collapsed: Container(
          height: _panelMinSize,
          color: _colorScheme.secondary,
          child: Center(child: Text("Slide to Up ☝️")),
        ),
      ),
    );
  }
}
