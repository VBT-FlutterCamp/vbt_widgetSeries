import 'package:flutter/material.dart';
import 'package:vbt_camp_widget/feature/httpService/model/wiki_model.dart';
import 'package:vbt_camp_widget/feature/httpService/service/wiki_service.dart';

class WikiView extends StatefulWidget {
  const WikiView({Key? key}) : super(key: key);

  @override
  _WikiViewState createState() => _WikiViewState();
}

class _WikiViewState extends State<WikiView> {
  final WikiService _wikiService = WikiService();
  WikiModel? _wikiModel;
  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void init() async {
    _wikiModel = await _wikiService.getWikipedia();
    changeLoading();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (() async {
          _wikiModel = await _wikiService.getWikipedia();
          changeLoading();
        })),
        body: isLoading
            ? ListView.builder(
                itemCount: _wikiModel?.items?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const FlutterLogo(size: 100),
                    title: Text(_wikiModel?.items?[index].article ?? ''),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_wikiModel?.items?[index].views.toString() ?? ''),
                        Text(_wikiModel?.items?[index].timestamp ?? '')
                      ],
                    ),
                  );
                },
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
