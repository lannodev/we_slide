// Controller
import 'package:flutter/material.dart';

class WeSlideController {
  AnimationController ac;
  double screenHeight;
  Animation<double> borderRadiusAnimation;
  Animation fadeAnimation;
  final ValueNotifier<bool> isPanelVisible = ValueNotifier<bool>(false);

  WeSlideController();

  //hide the panel
  void hide() {
    ac.reverse().then((x) {
      print("** Hide Panel **");
      isPanelVisible.value = false;
    });
  }

  //show the panel
  void show() {
    ac.forward().then((x) {
      print("** Show Panel **");
      isPanelVisible.value = true;
    });
  }

  // Gesture Vertical End
  void handleVerticalEnd(DragEndDetails endDetails) {
    if (ac.value >= 0.5) {
      ac.forward().then((x) {
        isPanelVisible.value = true;
      });
    } else {
      ac.reverse().then((x) {
        isPanelVisible.value = false;
      });
    }
  }

  // Gesture Vertical Update
  void handleVerticalUpdate(DragUpdateDetails updateDetails) {
    var fractionDragged = updateDetails.primaryDelta / screenHeight;
    ac.value -= 1.5 * fractionDragged;
  }

  // Get Body Animation
  Animation<Offset> getAnimationOffSet({@required double minSize, @required double maxSize}) {
    final _closedPercentage = (screenHeight - minSize) / screenHeight;
    final _openPercentage = maxSize / screenHeight;
    return Tween<Offset>(begin: Offset(0.0, _closedPercentage), end: Offset(0.0, _openPercentage)).animate(ac);
  }

  // Dispose
  void dispose() {
    ac.dispose();
  }
}
