import 'package:flutter/cupertino.dart';
import 'package:vexana/vexana.dart';
import 'package:weather/core/constants/data_constants.dart';
import 'package:weather/core/models/result_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather/core/models/weather_model.dart';

class DataProvider extends ChangeNotifier {
  bool loading = false;
  late INetworkManager manager;
  List<ResultModel> results = [];

  Future<void> getDatas(String address, BuildContext context) async {
    changeLoad();
    manager = NetworkManager(
        options: BaseOptions(baseUrl: DataConstants.instance.baseUrl, headers: {
      'content-type': DataConstants.instance.contentType,
      'authorization': DataConstants.instance.apiKey
    }));

    var response = await manager.send<WeatherModel, WeatherModel>(
        context.locale.toString() + DataConstants.instance.endPoint + address,
        parseModel: WeatherModel(),
        method: RequestType.GET);
    results = response.data!.result ?? [];
    changeLoad();
  }

  void changeLoad() {
    loading = !loading;
    notifyListeners();
  }
}
