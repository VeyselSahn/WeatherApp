import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/init/helper/get_text.dart';
import 'package:weather/core/localization/locale_keys.g.dart';

Widget weekList() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            getText(LocaleKeys.words_showAll),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Icon(
            Icons.navigate_next_outlined,
            color: Colors.white,
            size: 28,
          ),
        ],
      )),
    ),
  );
}
