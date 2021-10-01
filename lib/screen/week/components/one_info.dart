import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget oneinfo(String text1, text2, double fontSize, Color color) {
  return Column(
    children: [
      Text(
        text1,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
            color: Colors.white),
      ),
      Text(
        text2,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.normal, color: color),
      ),
    ],
  );
}
