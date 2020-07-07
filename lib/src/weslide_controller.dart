// Controller
import 'package:flutter/material.dart';

class WeSlideController {
  AnimationController ac;
  double screenHeight;
  Animation<double> panelborderRadius;
  Animation<double> bodyBorderRadius;
  Animation<double> scaleAnimation;
  Animation fadeAnimation;
  final ValueNotifier<bool> isPanelVisible = ValueNotifier<bool>(false);

  WeSlideController();

  //hide the panel
  void hide() {
    if (ac.value < 1.0) return;
    ac.reverse().then((x) {
      isPanelVisible.value = false;
    });
  }

  //show the panel
  void show() {
    if (ac.value > 0.0) return;
    ac.forward().then((x) {
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
