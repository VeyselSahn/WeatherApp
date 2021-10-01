import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/core/provider/data_provider.dart';
import 'package:provider/provider.dart';
import 'package:weather/screen/splash/components/indicator.dart';
import 'package:weather/screen/today/components/week_list.dart';
import 'package:weather/screen/week/week_screen.dart';
import 'components/appbar.dart';
import 'components/infos.dart';

class TodayScreen extends StatefulWidget {
  final String? address;
  TodayScreen({Key? key, this.address}) : super(key: key);

  @override
  _TodayScreenState createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      final data = Provider.of<DataProvider>(context, listen: false);
      await data.getDatas(widget.address ?? 'London', context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, widget.address ?? ''),
      body: body(),
    );
  }

  Widget body() {
    return Consumer<DataProvider>(
      builder: (context, value, child) {
        return value.loading == true || value.results.isEmpty == true
            ? indicator()
            : SafeArea(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blueGrey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SvgPicture.network(
                              value.results[0].icon ?? '',
                            ),
                          ),
                        ),
                        detail(context, value.results),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        WeekScreen(list: value.results),
                                  ));
                            },
                            child: weekList())
                      ],
                    )),
              );
      },
    );
  }
}
