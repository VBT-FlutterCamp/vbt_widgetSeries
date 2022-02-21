import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../product/companents/text/app_text_strings.dart';
import '../model/post_model.dart';
import '../service/post_service.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  PostService _postService = PostService();
  List<PostModel>? _postModel;
  bool isLoading = false;
  bool openText = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> init() async {
    //isloading=false
    _postModel = await _postService.fetchPost();

    changeLoading();
    //isloading=true
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          init();
        },
      ),
      body: isLoading
          ? ListView.builder(
              itemCount: _postModel?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: FlutterLogo(size: context.mediumValue),
                    title: Text(_postModel?[index].title ?? AppString().nullData),
                    subtitle: InkWell(
                      onTap: () {
                        setState(() {
                          openText = !openText;
                        });
                      },
                      child: Text(
                        _postModel?[index].body ?? AppString().nullData,
                        style: openText
                            ? TextStyle()
                            : TextStyle(
                                foreground: Paint()
                                  ..shader = LinearGradient(colors: [Colors.grey, Colors.white])
                                      .createShader(Rect.fromLTWH(0, 0, 500, 0))),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: openText ? 20 : 2,
                      ),
                    ),
                    trailing: const Icon(Icons.ac_unit_rounded),
                  ),
                );
              },
            )
          : const SizedBox(),
    );
  }
}
