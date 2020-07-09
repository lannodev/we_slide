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

## Basic Example

```dart
import 'package:we_slide/we_slide.dart';

final _colorScheme = Theme.of(context).colorScheme;
final double _panelMinSize = 70.0;
final double _panelMaxSize = MediaQuery.of(context).size.height / 2;
return Scaffold(
  backgroundColor: Colors.black,
  body: WeSlide(
    panelMinSize: _panelMinSize,
    panelMaxSize: _panelMaxSize,
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

```

<p>
  <img width="205px" alt="Example" src="assets/basic_example.gif"/>
</p>


