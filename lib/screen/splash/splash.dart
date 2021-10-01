import 'package:flutter/material.dart';
import 'package:weather/core/init/permissions/location_perms.dart';
import 'package:weather/core/provider/address_provider.dart';
import 'package:provider/provider.dart';
import 'package:weather/screen/today/today.dart';
import 'components/indicator.dart';

class Splash extends StatefulWidget {
  final String? address;
  const Splash({Key? key, this.address}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    final value = context.read<AddressProvider>();
    value.address == ''
        ? locationPerms().then((_) => value.getAddress())
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AddressProvider>(
            builder: (context, value, child) =>
                value.loading == true || value.address.isEmpty == true
                    ? indicator()
                    : TodayScreen(address: value.address)));
  }
}
