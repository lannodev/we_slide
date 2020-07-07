<p align="center">
    <img src="assets/logo.png" width="300" >
</p>

# we_slide
[![pub package](https://img.shields.io/pub/v/we_slide.svg)](https://pub.dartlang.org/packages/we_slide)
[![GitHub Stars](https://img.shields.io/github/stars/luciano-work/we_slide?logo=github)](https://github.com/luciano-work/we_slide)
[![Platform](https://img.shields.io/badge/platform-android%20|%20ios-green.svg)](https://img.shields.io/badge/platform-Android%20%7C%20iOS-green.svg)

A backdrop animated widget appears behind all other surfaces in an app, displaying contextual and actionable content.

<p>
  <img width="205px" alt="Example" src="assets/demo.gif"/>
</p>

## Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  we_slide: ^0.1.0
```

## Usage

```dart
import 'package:we_slide/we_slide.dart';

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

```


