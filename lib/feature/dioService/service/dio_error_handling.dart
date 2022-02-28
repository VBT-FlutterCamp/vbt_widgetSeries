/* import 'package:dio/dio.dart';

class ErrorHandling {
  void handlingErrors() async {
    Dio dio = Dio();
    try {
      var response = await dio.get('https://thissitenotexistssoimpossibletogotothissite.blabla.notreal.x.c.z');
      print(response);
    } on DioError catch (e) {
      print('Type: ' + e.type.toString());
      print('Message: ' + e.message);
      print('Error: ' + e.error);
    }
  }
}
 */