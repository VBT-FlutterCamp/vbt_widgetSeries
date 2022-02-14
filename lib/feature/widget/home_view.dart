import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Icon(Icons.backspace_outlined),
        actions: [Icon(Icons.favorite)],
        title: Text('Hoşgeldinz'),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Selam'),
              SizedBox(height: 80, width: 80, child: Image.asset("assets/images/dog.jpeg")),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'İlerle',
                    style: Theme.of(context).textTheme.headline1?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(elevation: 10, onPrimary: Colors.black, primary: Colors.purple),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    color: Colors.red,
                    height: 10,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.black,
                  height: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
