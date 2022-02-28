// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// import '../model/album_model.dart';

// class AlbumView extends StatefulWidget {
//   const AlbumView({Key? key}) : super(key: key);

//   @override
//   State<AlbumView> createState() => _AlbumViewState();
// }

// class _AlbumViewState extends State<AlbumView> {
//   Future<List<AlbumModel>> _getAlbumList() async {
//     try {
//       var response = await Dio().get('https://jsonplaceholder.typicode.com/albums');

//       List<AlbumModel> _albumlist = [];
//       if (response.statusCode == 200) {
//         _albumlist = (response.data as List).map((e) => AlbumModel.fromJson(e)).toList();
//       }
//       return _albumlist;
//     } on DioError catch (e) {
//       return Future.error(e.message);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('API Request With Dio'),
//         ),
//         body: Center(
//             child: FutureBuilder<List<AlbumModel>>(
//                 future: _getAlbumList(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     var albumList = snapshot.data;
//                     return ListView.builder(
//                       itemCount: albumList?.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         var album = albumList?[index];
//                         return Card(
//                           elevation: 10,
//                           child: ListTile(
//                             title: Text(album?.id.toString() ?? ''),
//                             subtitle: Text(album?.title ?? ' Name not found'),
//                           ),
//                         );
//                       },
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text(snapshot.error.toString());
//                   } else
//                     return CircularProgressIndicator();
//                 })));
//   }
// }
