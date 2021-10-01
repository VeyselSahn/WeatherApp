import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/models/result_model.dart';

Widget degreeinfo(ResultModel element, List<double> fontSizes) {
  return Column(
    children: [
      Text(
        element.degree ?? '',
        style: TextStyle(color: Colors.white, fontSize: fontSizes.first),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        element.description ?? '',
        style: TextStyle(color: Colors.yellowAccent, fontSize: fontSizes[1]),
      )
    ],
  );
}
