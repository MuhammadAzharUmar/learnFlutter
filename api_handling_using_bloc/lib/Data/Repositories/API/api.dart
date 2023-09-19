import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  final Dio _dio = Dio(); //dio instence
  API() {
    _dio.options.baseUrl =
        "https://jsonplaceholder.typicode.com"; //common url for all
    _dio.interceptors.add(
        PrettyDioLogger()); //just to intercept and log all _dio requests etc
  }
  //getter
  Dio get sendRequest => _dio;
}

