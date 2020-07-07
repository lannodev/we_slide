import 'package:example/pages/explore.dart';
import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';
import 'widgets/custom_bottom_bar.dart';
import 'widgets/miniplayer.dart';
import 'theme.dart';
import 'pages/player.dart';
import 'pages/explore.dart';

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
      home: HomePage(),
      color: Colors.black,
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
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: WeSlide(
        controller: controller,
        panelMaxSize: 0.0,
        panelMinSize: 130.0,
        hideFooter: true,
        hidecollapsed: true,
        panelBorderRadiusBegin: 12.0,
        panelBorderRadiusEnd: 0.0,
        bodyBorderRadiusBegin: 0.0,
        bodyBorderRadiusEnd: 12.0,
        parallax: false,
        transformScale: true,
        parallaxOffset: 0.9,
        footerOffset: footerHeight,
        backdropOpacity: 0.9,
        backdropColor: Colors.black,
        panelBackground: colorScheme.background,
        animateDuration: const Duration(milliseconds: 200),
        fadeSequence: [
          TweenSequenceItem<double>(weight: 1.0, tween: Tween(begin: 1, end: 0)),
          TweenSequenceItem<double>(weight: 8.0, tween: Tween(begin: 0, end: 0)),
        ],
        body: Explore(),
        panel: Player(onTap: controller.hide),
        collapsed: MiniPlayer(onTap: controller.show),
        footer: CustomBottomBar(onTap: (int index) {}, selectedIndex: 0),
      ),
    );
  }
}
