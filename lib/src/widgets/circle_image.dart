import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String path;
  final double strokeWidth;
  final Color strokeColor;

  const CircleImage({
    Key key,
    this.path,
    this.strokeWidth = 5.0,
    this.strokeColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: strokeColor,
          width: strokeWidth,
        ),
      ),
      width: 150,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          child: Image(
            fit: BoxFit.cover,
            image: AssetImage(path),
          ),
        ),
      ),
    );
  }
}
