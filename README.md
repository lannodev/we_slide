<p align="center">
    <img src="assets/logo.png" width="300" >
</p>

[![pub package](https://img.shields.io/pub/v/we_slide.svg)](https://pub.dartlang.org/packages/we_slide)
[![GitHub Stars](https://img.shields.io/github/stars/luciano-work/we_slide?logo=github)](https://github.com/luciano-work/we_slide)
[![Platform](https://img.shields.io/badge/platform-android%20|%20ios-green.svg)](https://img.shields.io/badge/platform-Android%20%7C%20iOS-green.svg)

The inspiration behind the package was actually a need for a slide transition like spotify (iOS)
Unfortunately, I couldn’t find any efficient package, so I literally banged my fist on the table, 
rolled up my sleeves and created my own solution. Through this package I could better understand 
some principles of flutter animation :)

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
    panelHeader: Container(
      height: _panelMinSize,
      color: _colorScheme.secondary,
      child: Center(child: Text("Slide to Up ☝️")),
    ),
  ),
);

```

## Custom properties
There are many options that you can change:

|  Properties  |   Type   |   Description   |
|--------------|----------|-----------------|
|   `footer`   |  Widget  | This is the widget that will be below as a footer, this can be used as a `BottomNavigationBar` |

<p>
  <img width="205px" alt="Example" src="assets/basic_example.gif"/>
</p>


