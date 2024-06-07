import 'package:dio/dio.dart';

class CustomDio4App {
  final _dio = Dio();
  Dio get dio => _dio;
  final _keyApplicationId = 'Ffxb8I8Y6fRln0wta3CxBlaUK0dRTvQEQkBQM69k';
  final _keyrestApiKey = '6nYVkPej9p3G0k9fzWBGgTk7m4yoOpgos3aGsKtl';
  final _keyParseServerUrl = 'https://parseapi.back4app.com/classes';

  CustomDio4App() {
    _dio.options.headers["X-Parse-Application-Id"] = _keyApplicationId;
    _dio.options.headers["X-Parse-REST-API-Key"] = _keyrestApiKey;
    _dio.options.baseUrl = _keyParseServerUrl;
  }
}
