import 'package:flutter/material.dart';

class GradientColor {
  double stop;
  int red, green, blue;
  Color color;

  GradientColor(this.red, this.green, this.blue, this.stop) {
    this.color = Color.fromRGBO(red, green, blue, 1);
  }

  setRed(int value) {
    red = value;
    this.color = Color.fromRGBO(red, green, blue, 1);
  }

  setBlue(int value) {
    blue = value;
    this.color = Color.fromRGBO(red, green, blue, 1);
  }

  setGreen(int value) {
    green = value;
    this.color = Color.fromRGBO(red, green, blue, 1);
  }

  setStop(double value) => this.stop = value;
}
