// import 'package:dio/dio.dart';

// class DioOptionsExample {
//   void optionsSample() async {
//     BaseOptions options = BaseOptions(
//       baseUrl: 'https://postman-echo.com',
//       connectTimeout: 2000,
//       receiveTimeout: 2000,
//     );
//     Dio dio = Dio(options);
//     dio.options.receiveTimeout = 1000;
//     dio.options.headers['accept-language'] = 'tr-TR';
//     var response = await dio.get('/get?foo1=bar1&foo2=bar2');
//     print(response);
//     // Response'ta gönderdiğiniz header bilgilerini görebilirsiniz..
//   }
// }
