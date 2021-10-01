import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/provider/address_provider.dart';
import 'package:weather/core/provider/data_provider.dart';
import 'package:weather/screen/splash/splash.dart';

import 'core/localization/lang_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: LangConstants.SUPPORTED_LOCALE,
      path: LangConstants.LANG_PATH,
      saveLocale: true,
      fallbackLocale: LangConstants.EN_LOCALE,
      useOnlyLangCode: true,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddressProvider>(
            create: (_) => AddressProvider()),
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider())
      ],
      child: MaterialApp(
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        title: 'Weather',
        home: Splash(),
      ),
    );
  }
}
