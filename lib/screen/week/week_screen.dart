import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/core/models/result_model.dart';
import 'package:weather/core/provider/address_provider.dart';
import 'package:provider/provider.dart';
import 'package:weather/screen/week/components/degree_info.dart';
import 'package:weather/screen/week/components/info_rows.dart';

class WeekScreen extends StatefulWidget {
  WeekScreen({Key? key, required this.list}) : super(key: key);
  final List<ResultModel> list;

  @override
  _WeekScreenState createState() => _WeekScreenState();
}

class _WeekScreenState extends State<WeekScreen> {
  @override
  Widget build(BuildContext context) {
    final value = context.read<AddressProvider>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          title: Text(
            value.address,
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.blueGrey,
        body: body());
  }

  Widget body() {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return contentBox(widget.list[index]);
          },
        ));
  }

  Widget contentBox(ResultModel element) {
    return Column(
      children: [
        Text(
          element.date ?? '',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        SizedBox(height: 8),
        Stack(
          children: <Widget>[
            Center(
              child: Container(
                padding:
                    EdgeInsets.only(left: 20, top: 65, right: 20, bottom: 20),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                      colors: [Colors.blueGrey.shade300, Colors.grey]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    degreeinfo(element, [20, 16]),
                    SizedBox(
                      height: 15,
                    ),
                    inforows(element, 16)
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 45,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(45)),
                    child: SvgPicture.network(element.icon ?? '')),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
