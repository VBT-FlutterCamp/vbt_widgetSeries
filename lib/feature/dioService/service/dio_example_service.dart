/* //bacis request
import 'package:dio/dio.dart';

// Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout

class DioServiceBasicRequest {
  Dio dio = new Dio();

  void getHTTP(String url) async {
    try {
      Response response = await dio.get(url);
      // Do whatever
    } on DioError catch (e) {
      // Do whatever
    }
  }

  void postHTTP(String url, Map data) async {
    try {
      Response response = await dio.post(url, data: data);
      // Do whatever
    } on DioError catch (e) {
      // Do whatever
    }
  }

  void putHTTP(String url, Map data) async {
    try {
      Response response = await dio.put(url, data: data);
      // Do whatever
    } on DioError catch (e) {
      // Do whatever
    }
  }

  void deleteHTTP(String url) async {
    try {
      Response response = await dio.delete(url);
      // Do whatever
    } on DioError catch (e) {
      // Do whatever
    }
  }
}
 */