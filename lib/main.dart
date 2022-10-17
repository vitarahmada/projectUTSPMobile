import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    title: "CRUD Data Obat",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  //mengambil data dari database dan disimpan di list
  Future<List> getData() async {
    //memasukkan alamat url untuk mengambil data
    final response =
        await http.get(Uri.parse('http://10.0.2.2:080/data_obat/getdata.php'));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(
            255, 230, 168, 87), //memberi warna background pada title appBar
        title: new Text("DATA OBAT"),
      ),

      backgroundColor: Color.fromARGB(255, 241, 221, 195),

      //memasukkan data ke dalam list
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            print(snapshot.error); //jika snapshot ada error, maka print error

          //jika data snapshot nya ada, maka akan dibuat list
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                ) //mengirim data ke ItemList
              : new Center(
                  child: new CircularProgressIndicator(),
                ); //jika data tidak ada, maka akan menampilkan indikator loading
        },
      ),
    );
  }
}

//class untuk ItemList
class ItemList extends StatelessWidget {
  final list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      //jumlah data yang di ambil dari snapshot
      //data snapshot di kirim ke ItemList
      itemCount: list == null
          ? 0
          : list.length, //jika list == null maka item countnya 0
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(5.0),
          child: new Card(
            child: new ListTile(
              title: new Text(list[i]['nama_obat']),
              leading: new Icon(Icons.widgets),
              subtitle: new Text("Stock : ${list[i]['jumlah_stok']}"),
            ),
          ),
        );
      },
    );
  }
}
