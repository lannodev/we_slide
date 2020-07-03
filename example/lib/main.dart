import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeSlide Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controller
  WeSlideController controller = WeSlideController();
  double footerHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: WeSlide(
        controller: controller,
        panelMaxSize: 0.0,
        panelMinSize: 135.0, //controller.player.currentMusic != null ? 135.0 : 0.0,
        hideFooter: true,
        borderRadiusBegin: 12.0,
        borderRadiusEnd: 0.0,
        parallax: true,
        parallaxOffset: 0.9,
        footerOffset: footerHeight,
        backdropOpacity: 0.8,
        backdropColor: Colors.black,
        animateDuration: const Duration(milliseconds: 300),
        fadeSequence: [
          TweenSequenceItem<double>(weight: 1.0, tween: Tween(begin: 1, end: 0)),
          TweenSequenceItem<double>(weight: 8.0, tween: Tween(begin: 0, end: 0)),
        ],
        body: Container(color: Colors.white),
        panel: Container(color: Colors.red),
        collapsed: Container(color: Colors.green),
        footer: Container(
          color: Colors.blue,
          height: footerHeight,
        ),
      ),
    );
  }
}
