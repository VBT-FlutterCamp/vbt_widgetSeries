import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Tittle'),
          ElevatedButton(
            onPressed: () {},
            child: Text('Tittle'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Tittle'),
          )
        ],
      ),
    );
  }
}