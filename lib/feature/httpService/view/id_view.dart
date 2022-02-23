import 'package:flutter/material.dart';

import '../model/id_model.dart';
import '../service/id_service.dart';

class IdView extends StatefulWidget {
  const IdView({Key? key}) : super(key: key);

  @override
  _IdViewState createState() => _IdViewState();
}

class _IdViewState extends State<IdView> {
  IdService _idService = IdService();

  IdModel? _idModel;

  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> init() async {
    _idModel = await _idService.getIds("1");
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
        body: isLoading
            ? Center(
                child: Card(
                  child: Text(_idModel?.title ?? ''),
                ),
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
