import 'details.dart';
import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';
import 'home.dart';
import 'bottom_bar.dart';

class StoreApp extends StatefulWidget {
  StoreApp({Key key}) : super(key: key);

  @override
  _StoreAppState createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _controller = WeSlideController();
    return Scaffold(
      body: WeSlide(
        controller: _controller,
        parallax: true,
        transformScale: true,
        bodyBorderRadiusBegin: 0.0,
        bodyBorderRadiusEnd: 12.0,
        panelBorderRadiusBegin: 0.0,
        panelBorderRadiusEnd: 12.0,
        transformScaleEnd: 0.85,
        panelMinSize: 0.0,
        panelMaxSize: _size.height * .90,
        footerOffset: 60.0,
        body: Home(onTap: _controller.show),
        panel: Details(onTap: _controller.hide),
        footer: BottomBar(),
      ),
    );
  }
}
