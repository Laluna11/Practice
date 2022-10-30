import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "ListView.Builder",
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: const ListViewBuilder(),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: WidgetModels().showDrawer(context),
        ),
        appBar: AppBar(
          title: const Text('ListView Examples'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.phone),
              ),
              Tab(
                icon: Icon(Icons.phone_iphone),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            const ImageView(),
            ListViewBuilderNew(),
          ],
        ),
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/tech.jpg'),
      ],
    );
  }
}

class ListViewBuilderNew extends StatelessWidget {
  ListViewBuilderNew({Key? key}) : super(key: key);

  List<String> phoneName = ["Iphone", "Samsung"];

  List<String> phonePic = ["iphone", "samsung"];

  @override
  Widget build(BuildContext context) {
    // const snackBar = SnackBar(
    //   content: Text('Yay! A SnackBar!'),
    // );
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 30),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return WidgetModels().listInfo(
          index: index,
          context: context,
          imageName: 'assets/images/${phonePic[index]}.jpg',
          phoneName: phoneName,
          phonePic: phonePic,
          // onTap: () {
          //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // },
        );
      },
    );
  }
}
