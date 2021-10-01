import 'package:flutter/material.dart';
import 'package:weather/core/constants/color_constant.dart';
import 'package:weather/core/init/helper/get_text.dart';
import 'package:weather/core/localization/locale_keys.g.dart';
import 'package:weather/core/models/result_model.dart';
import 'package:weather/screen/week/components/one_info.dart';

Row inforows(ResultModel element, double font) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      oneinfo(element.min.toString(), getText(LocaleKeys.words_min), font,
          ColorConstant.minColor),
      oneinfo(element.max.toString(), getText(LocaleKeys.words_max), font,
          ColorConstant.maxColor),
      oneinfo(element.humidity.toString(), getText(LocaleKeys.words_hum), font,
          ColorConstant.humColor),
    ],
  );
}
