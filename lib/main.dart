import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "CRUD Data Pelanggan Apotek",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("DATA PELANGGAN APOTEK"),
      ),
    );
  }
}
