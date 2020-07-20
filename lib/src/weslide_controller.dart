// Controller
import 'package:flutter/material.dart';

class WeSlideController {
  final ValueNotifier<bool> isPanelVisible = ValueNotifier<bool>(false);
  Function show;
  Function hide;
}
