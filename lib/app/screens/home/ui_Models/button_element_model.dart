import 'package:flutter/material.dart';

class ButtonElement {
  ButtonElement(
      {@required this.content, this.isDark = false, this.isBig = false});

  final String content;
  final bool isDark;
  final bool isBig;
}
