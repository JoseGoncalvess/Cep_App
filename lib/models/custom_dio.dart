import 'package:dio/dio.dart';

class CustomDio4App {
  final _dio = Dio();
  Dio get dio => _dio;
  final _keyApplicationId = '';
  final _keyrestApiKey = '';
  final _keyParseServerUrl = 'https://parseapi.back4app.com/classes';

  CustomDio4App() {
    _dio.options.headers["X-Parse-Application-Id"] = _keyApplicationId;
    _dio.options.headers["X-Parse-REST-API-Key"] = _keyrestApiKey;
    _dio.options.baseUrl = _keyParseServerUrl;
  }
}
