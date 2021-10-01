import 'package:vexana/vexana.dart';
import 'package:weather/core/models/result_model.dart';

class WeatherModel extends INetworkModel<WeatherModel> {
  bool? success;
  String? city;
  List<ResultModel>? result;

  WeatherModel({this.success, this.city, this.result});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    city = json['city'];
    if (json['result'] != null) {
      result = <ResultModel>[];
      json['result'].forEach((v) {
        result!.add(ResultModel.fromJson(v));
      });
    }
  }

  @override
  WeatherModel fromJson(Map<String, dynamic> json) {
    return WeatherModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
