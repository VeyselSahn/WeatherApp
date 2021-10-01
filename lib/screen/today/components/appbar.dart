import 'package:flutter/material.dart';
import 'package:weather/core/init/helper/get_text.dart';
import 'package:weather/core/localization/locale_keys.g.dart';
import 'package:weather/core/provider/address_provider.dart';
import 'package:provider/provider.dart';
import 'package:weather/screen/splash/splash.dart';
import 'package:weather/screen/today/components/pop_up.dart';

AppBar appbar(BuildContext context, String address) {
  final value = context.read<AddressProvider>();
  return value.isSearch == true
      ? textBar(value, context)
      : AppBar(
          leading: menu(),
          title: Text(address),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          actions: [
            IconButton(
                onPressed: () {
                  value.changeBar();
                },
                icon: Icon(Icons.search))
          ],
        );
}

AppBar textBar(AddressProvider value, BuildContext context) {
  TextEditingController controller = TextEditingController();
  return AppBar(
      titleSpacing: 0.0,
      backgroundColor: Colors.blueGrey,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.all(10),
        child: TextFormField(
          controller: controller,
          onFieldSubmitted: (value) {},
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            border: InputBorder.none,
            hintText: getText(LocaleKeys.words_search),
            hintStyle: TextStyle(color: Colors.black),
            focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.white),
            ),
            prefixIcon: Icon(
              Icons.location_on,
              color: Colors.black,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                if (controller.text.isEmpty) {
                  value.changeBar();
                } else {
                  value.setAddress(controller.text);
                  value.changeBar();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Splash(),
                      ),
                      (route) => false);
                }
              },
            ),
          ),
        ),
      ));
}
