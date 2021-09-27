import 'package:flutter/material.dart';
import 'package:omdb/search_bar.dart';

void main() {
  runApp(MaterialApp(
      title: "OMDB",
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MainPage()));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Column(
                children: const <Widget>[
                  SearchBar(),
                ],
              ))),
    );
  }
}
