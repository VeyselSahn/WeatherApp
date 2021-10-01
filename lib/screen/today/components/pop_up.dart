import 'package:flutter/material.dart';
import 'package:weather/core/init/helper/get_text.dart';
import 'package:weather/core/localization/lang_constants.dart';
import 'package:weather/core/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

PopupMenuButton menu() {
  List<String> options = [
    getText(LocaleKeys.words_theme),
    getText(LocaleKeys.words_lang)
  ];
  void changeLang(BuildContext context) {
    context.locale.toString() == 'en'
        ? context.setLocale(LangConstants.TR_LOCALE)
        : context.setLocale(LangConstants.EN_LOCALE);
  }

  return PopupMenuButton<String>(
      icon: Icon(Icons.menu),
      onSelected: choiceAction,
      itemBuilder: (BuildContext context) {
        return options.map((String choice) {
          return PopupMenuItem<String>(
            onTap: () {
              if (choice == getText(LocaleKeys.words_theme)) {
              } else if (choice == getText(LocaleKeys.words_lang)) {
                changeLang(context);
              } else {}
            },
            value: choice,
            child: Text(choice),
          );
        }).toList();
      });
}

void choiceAction(String choice) {
  if (choice == getText(LocaleKeys.words_theme)) {
  } else if (choice == getText(LocaleKeys.words_lang)) {
  } else {}
}
