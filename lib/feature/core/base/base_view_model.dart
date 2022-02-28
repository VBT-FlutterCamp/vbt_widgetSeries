import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

abstract class BaseViewModel {
  late BuildContext context;
  INetworkManager get networkmanager => NetworkManager(options: BaseOptions(baseUrl: 'https://reqres.in/'));

  void setContext(BuildContext context) {}
  void init() {}
}
