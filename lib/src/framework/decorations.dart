import 'package:flutter/material.dart';

const boxSahdow = [
  BoxShadow(
    color: Color(0x2A000000),
    offset: Offset(3, 3),
    blurRadius: 6.0,
  )
];

const cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(15)),
    boxShadow: boxSahdow);
