import 'package:flutter/material.dart';

class GradientColor {
  int red, green, blue;
  Color color;

  GradientColor(this.red, this.green, this.blue) {
    color = Color.fromRGBO(red, green, blue, 255);
  }
}
