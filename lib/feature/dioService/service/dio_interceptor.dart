import 'package:dio/dio.dart';

class DioInterceptor {
  void interceptorBasics() async {
    Dio dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print('Sending request to: ' + options.path);
      return handler.next(options);
    }, onResponse: (response, handler) {
      print('Response status code: ' + response.statusCode.toString());
      print('Response data: ' + response.data.toString());
      return handler.next(response);
    }, onError: (DioError e, handler) {
      print('Error received! Message is: ' + e.message);
      return handler.next(e);
    }));
    await dio.get('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
  }
}

// https://www.youtube.com/watch?v=-ky5AnTV6Ig 
//https://gist.github.com/VB10/d71a90971a7d86450254a2bea3db1c04 ssnippet 