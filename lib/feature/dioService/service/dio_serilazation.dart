// import 'package:dio/dio.dart';

// class DataModel {
//   final String strVal;
//   final int intVal;
//   // Class initialize etmek için
//   DataModel(this.strVal, this.intVal);
//   // Json'dan modele dönüştürme
//   DataModel.fromJson(Map<String, dynamic> json)
//       : strVal = json['strVal'],
//         intVal = json['intVal'];
//   // Modelden Json'a  dönüştürme
//   Map<String, dynamic> toJson() => {"strVal": this.strVal, "intVal": this.intVal};
// }

// class ResponseModel {
//   final DataModel data;
//   final HeadersModel headers;
//   final String url;

//   ResponseModel.fromJson(Map<String, dynamic> json)
//       : data = DataModel.fromJson(json['data']),
//         headers = HeadersModel.fromJson(json['headers']),
//         url = json['url'];
// }

// class HeadersModel {
//   final String forwardedProto;
//   final String forwardedPort;
//   final String amznTraceId;
//   final String contentLength;
//   final String userAgent;
//   final String acceptEncoding;

//   HeadersModel.fromJson(Map<String, dynamic> json)
//       : forwardedProto = json['x-forwarded-proto'],
//         forwardedPort = json['x-forwarded-port'],
//         amznTraceId = json['x-amzn-trace-id'],
//         contentLength = json['content-length'],
//         userAgent = json['user-agent'],
//         acceptEncoding = json['accept-encoding'];
// }

// class DioSerilazationExample {
//   void serializationSample() async {
//     DataModel requestModel = new DataModel("aStringValue", 105);
//     Response response = await Dio().post('https://postman-echo.com/post', data: requestModel);
//     ResponseModel responseModel = ResponseModel.fromJson(response.data);
//     print("Please debug responseModel. " + responseModel.toString());
//   }
// }
