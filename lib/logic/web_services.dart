import 'package:dio/dio.dart';

class WebServices {
  static late Dio dio;

  static init() {
dio=Dio(
  BaseOptions(baseUrl: 'https://newsapi.org/',
    connectTimeout: 3000,
    receiveTimeout: 3000,
    receiveDataWhenStatusError: true
  )
);
  }
  Future<Response>getData({required String url,required Map<String,dynamic> query})async{
    return await dio.get(url,queryParameters: query);}
}
//d6b8c20bfcd14b379196b2d54c9c1d08
//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d6b8c20bfcd14b379196b2d54c9c1d08