// Controller
import 'package:flutter/material.dart';

class WeSlideController extends ValueNotifier<bool> {
  // Constructor
  WeSlideController() : super(false);

  //show WeSlide Panel
  void show() => value = true;

  //hide WeSlide Panel
  void hide() => value = false;

  // Returns if the WeSlide Panel is opened or not
  bool get isOpened => value;
}
