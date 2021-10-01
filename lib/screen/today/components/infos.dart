import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/models/result_model.dart';
import 'package:weather/screen/week/components/degree_info.dart';
import 'package:weather/screen/week/components/info_rows.dart';

Widget detail(BuildContext context, List<ResultModel> data) {
  return Expanded(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: [Colors.blueGrey.shade300, Colors.grey])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            degreeinfo(data.first, [25, 20]),
            inforows(data.first, 20)
          ],
        ),
      ),
    ),
  );
}
