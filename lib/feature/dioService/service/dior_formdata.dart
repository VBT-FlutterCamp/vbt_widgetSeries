// import 'package:dio/dio.dart';

// class DioFormData {
//   void formDataMultipleFileSample() async {
//     // Bu ilk bölümde 2 tane örnek resim örnek için indirilip documents klasörüne kaydedilecektir.
//     final directory = await getApplicationDocumentsDirectory();
//     String filePath = directory.path + '/googleImage.png';
//     String filePath2 = directory.path + '/luke.jpg';
//     await Dio()
//         .download('https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', filePath);
//     print("First image sample download complete!");
//     await Dio().download(
//         'https://www.jedbang.com/materials/images/products/products/4/4250/16118/hot-toys-luke-skywalker-crait-sixth-scale-figure-ht1-335-s0-p5-5000x5000-i16118.jpg',
//         filePath2);
//     print("All image samples download complete!");

//     // Daha sonra indirilmiş resimler bu bölümde FormData ile gönderilecektir.
//     var formData = FormData.fromMap({
//       'sampleType': 'formData',
//       'intVal': 200,
//       'files': [
//         await MultipartFile.fromFile(filePath, filename: 'googleImage.png'),
//         await MultipartFile.fromFile(filePath2, filename: 'luke.jpeg'),
//       ]
//     });
//     var response = await Dio().post('https://postman-echo.com/post', data: formData);
//     print(response);
//   }
// }



// //   FormData formData = FormData.fromMap({
// //   "name": "Ryan Dsilva",
// //   "age": 21,
// //   "file": await MultipartFile.fromFile("PATH", filename:"OPTIONAL"),
// // });
// // // Multiple Files with Additional Data
// // FormData formData = FormData.fromMap({
// //   "name": "Ryan Dsilva",
// //   "age": 21,
// //   "files": [
// //     await MultipartFile.fromFile("PATH", filename:"OPTIONAL"),
// //     MultipartFile.fromFileSync("PATH", filename:"OPTIONAL")
// //   ],
// // }); 
