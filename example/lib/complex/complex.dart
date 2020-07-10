import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';

import 'pages/explore.dart';
import 'pages/player.dart';
import 'widgets/custom_bottom_bar.dart';
import 'widgets/miniplayer.dart';

class Complex extends StatefulWidget {
  Complex({Key key}) : super(key: key);

  @override
  _ComplexState createState() => _ComplexState();
}

class _ComplexState extends State<Complex> {
  // Controller
  WeSlideController controller = WeSlideController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final double _panelMinSize = 130.0;
    final double _panelMaxSize = MediaQuery.of(context).size.height;
    final double _footerOffset = 60.0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: WeSlide(
        controller: controller,
        panelMaxSize: _panelMaxSize,
        panelMinSize: _panelMinSize,
        hideFooter: true,
        hidecollapsed: true,
        panelBorderRadiusBegin: 12.0,
        panelBorderRadiusEnd: 0.0,
        bodyBorderRadiusBegin: 0.0,
        bodyBorderRadiusEnd: 12.0,
        parallax: false,
        transformScale: true,
        parallaxOffset: 0.9,
        footerOffset: _footerOffset,
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
