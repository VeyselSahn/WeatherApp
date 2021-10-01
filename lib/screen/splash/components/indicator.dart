import 'package:flutter/material.dart';
import 'package:weather/core/init/helper/get_text.dart';
import 'package:weather/core/localization/locale_keys.g.dart';

Widget indicator() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(
          height: 6,
        ),
        Text(getText(LocaleKeys.words_loading))
      ],
    ),
  );
}
