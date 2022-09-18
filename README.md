<p align="center">
    <img src="https://github.com/luciano-work/we_slide/raw/master/assets/logo.png" width="250">
</p>

<p align="center">
    <a href="https://github.com/luciano-work/we_slide/stargazers">
        <img src="https://img.shields.io/github/stars/luciano-work/we_slide?colorA=1e1e28&colorB=c9cbff&style=for-the-badge&logo=starship">
    </a>
    <a href="https://github.com/luciano-work/we_slide/issues">
        <img src="https://img.shields.io/github/issues/luciano-work/we_slide?colorA=1e1e28&colorB=f7be95&style=for-the-badge">
    </a>
    <a href="https://github.com/luciano-work/we_slide/contributors">
        <img src="https://img.shields.io/github/contributors/luciano-work/we_slide?colorA=1e1e28&colorB=b1e1a6&style=for-the-badge">
    </a>
    <a href="https://pub.dartlang.org/packages/we_slide">
        <img src="https://img.shields.io/pub/v/we_slide?colorA=1e1e28&colorB=f5cd79&style=for-the-badge">
    </a>
</p>

The inspiration behind the package was actually a need for a slide transition like spotify (iOS)
Unfortunately, I couldn’t find any efficient package, so I literally banged my fist on the table, 
rolled up my sleeves and created my own solution. Through this package I could better understand 
some principles of flutter animation :)

<p>
  <img width="320px" alt="Music App" src="https://github.com/luciano-work/we_slide/raw/master/assets/music_app.gif"/>
  <img width="320px" alt="Store App" src="https://github.com/luciano-work/we_slide/raw/master/assets/store_app.gif"/>
</p>

## Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  we_slide: ^2.4.0
```

## Basic Example 
https://dartpad.dev/?id=6a833cba62679260bf1a556a4fdc9043

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

## Others Examples
Change propertie home to `MusicApp()` or `StoreApp` inside main.dart to see more examples 😊

## Custom properties
There are many options that you can change:

|Properties|Type|Description|
|---------------------------|----------|-----------------|
|`footer`|`widget`| This is the widget that will be below as a footer, this can be used as a `BottomNavigationBar` |
|`appbar`|`widget`| This is the widget that will be on top as a AppBar, this can be used as a `AppBar` |
|`body`|`widget` | This is the widget that will be hided with `Panel`. You can fit any widget. This parameter is required |
|`panel`|`widget`| This is the widget that will slide over the `Body`. You can fit any widget.|
|`panelHeader`|`widget`| This is the header that will be over the `Panel`. You can fit any widget. |
|`panelMinSize`|`double`|This is the initial value that set the `panel` min height. If the value is greater than 0, `panel` will be this size over `body`. By default is `150.0`. Set `0.0` if you want to hide `Panel`|
|`panelMaxSize`|`double`|This is the value that set the `panel` max height. When slide up the `panel`, this value define the max height that `panel` will be over `Body`. By default is `400.0` if you want that panel cover the whole `Body`, set with `MediaQuery.of(context).size.height`|
|`panelWidth`|`double`|This is the value that set the `panel` width, by default is `MediaQuery.of(context).size.width`|
|`panelBorderRadiusBegin`|`double`| Set this value to create a border radius over `panel`. When `panelBorderRadiusBegin` is diffrent from `panelBorderRadiusEnd` and the `panel` is slide up, this create an animation border over `panel`. By default is `0.0`|
|`panelBorderRadiusEnd`|`double`|Set this value to create a border radius over `panel`. When `panelBorderRadiusBegin` is diffrent from `panelBorderRadiusEnd` and the `panel` is slide up, this create an animation border over `panel`. By default is `0.0`|
|`bodyBorderRadiusBegin`|`double`|Set this value to create a border radius over `body`. When `bodyBorderRadiusBegin` is diffrent from `bodyBorderRadiusEnd` and the `panel` is slide up, this create an animation border over `body`. By default is `0.0`|
|`bodyBorderRadiusEnd`|`double`|Set this value to create a border radius over `body`. When `bodyBorderRadiusBegin` is diffrent from `bodyBorderRadiusEnd` and the `panel` is slide up, this create an animation border over `body`. By default is `0.0`|
|`bodyWidth`|`double`|This is the value that set the `body` width. By default is `MediaQuery.of(context).size.width`|
|`parallaxOffset`|`double`|Set this value to create a `parallax` effect when the `panel` is slide up. By default is `0.1`|
|`footerHeight`|`double`|This is the value that set the footer height. by default is `60.0`|
|`appBarHeight`|`double`|This is the value that set the appbar height. by default is `80.0`|
|`overlayOpacity`|`double`|This is the value that defines opacity overlay effect bethen `body` and `panel`.|
|`blurSigma`|`double`|This is the value that creates an image filter that applies a Gaussian blur.|
|`transformScaleBegin`|`double`|This is the value that defines `transform scale` begin effect. By default is `1.0`|
|`transformScaleEnd`|`double`|This is the value that defines `transform scale` end effect. By default is `0.9`|
|`overlayColor`|`color`|This is the value that defines overlay color effect. By default is `Colors.black`|
|`blurColor`|`color`|This is the value that defines blur color effect. By default is `Colors.black`|
|`backgroundColor`|`color`|This is the value that defines background color. By default is `Colors.black` end should be the same as `body`|
|`hideFooter`|`bool`|This is the value that defines if you want to hide the `footer`. By default is `true`|
|`hidePanelHeader`|`bool`|This is the value that defines if you want to hide the `panelHeader`. By default is `true`|
|`parallax`|`bool`|This is the value that defines if you want to enable `paralax` effect. By default is `false`|
|`transformScale`|`bool`|This is the value that defines if you want to enable `transform scale` effect. By default is `false`|
|`overlay`|`bool`|This is the value that defines if you want to enable `overlay effect`. By default is `false`|
|`blur`|`bool`|This is the value that defines if you want to enable `Gaussian blur effect`. By default is `false`|
|`animateDuration`|`bool`|This is the value that sets the duration of the `animation`. By default is `300 milliseconds`|
|`isDismissible`|`bool`|This parameter specifies whether the `panel`will be dismissed when user taps on the screen|
|`controller`|`WeSlideController`|This object used to control animations, using methods like `hide` or `show` to display panel and footer or check if is visible with variable `isOpened`|
|`fadeSequence`|`List<TweenSequenceItem<double>>`|This is the value that create a `fade transition` over `panel header`|
|`isUpSlide`|`bool`|This is the value that need up sliding panel if you want to enable Slide up through panel. By default is `true`|

## Support

If you want to be kind to me, then consider buying me a beer.

<a href="https://www.buymeacoffee.com/lanno"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a beer&emoji=🍺&slug=lanno&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff"></a>

Thankyou!

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/luciano-work/we_slide/issues

## License

[MIT License](./LICENSE)
