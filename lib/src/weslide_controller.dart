// Controller
import 'package:flutter/material.dart';

class WeSlideController {
  // Value notifier
  final ValueNotifier<bool> isPanelVisible = ValueNotifier<bool>(false);

  //show the panel
  void show() {
    isPanelVisible.value = true;
  }

  //hide the panel
  void hide() {
    isPanelVisible.value = false;
  }
}
