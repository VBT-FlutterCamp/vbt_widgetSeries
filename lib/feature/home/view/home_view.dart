import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            leading: FlutterLogo(
              curve: Curves.bounceInOut,
            ),
            // leadingWidth: 1000,
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.notification_important_rounded))],
            // pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Text('Welcome !'),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(onPressed: () {}, child: Text('ss')),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        SizedBox(
                            width: context.dynamicWidth(0.2),
                            child: Image.network("https://picsum.photos/id/237/200/300")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite),
                            Text('name'),
                          ],
                        )
                      ],
                    ),
                  );
                },
                childCount: 6,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
        ],
      ),
    );
  }
}
