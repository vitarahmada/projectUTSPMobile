import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class AddData extends StatefulWidget {
  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerKode = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerSatuan = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();
  TextEditingController controllerHargaBeli = new TextEditingController();
  TextEditingController controllerHargaJual = new TextEditingController();

  void AddData() {
    String url = "http://10.0.2.2:080/data_obat/adddata.php";

    http.post(Uri.parse(url), body: {
      "kodeobat": controllerKode.text,
      "namaobat": controllerNama.text,
      "satuan": controllerSatuan.text,
      "stock": controllerStock.text,
      "hargabeli": controllerHargaBeli.text,
      "hargajual": controllerHargaJual.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(
            255, 230, 168, 87), //memberi warna background pada title appBar
        title: new Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerKode,
                  decoration: new InputDecoration(
                      hintText: "Kode Obat", labelText: "Kode Obat"),
                ),
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Nama Obat", labelText: "Nama Obat"),
                ),
                new TextField(
                  controller: controllerSatuan,
                  decoration: new InputDecoration(
                      hintText: "Satuan", labelText: "Satuan"),
                ),
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                      hintText: "Stock", labelText: "Stock"),
                ),
                new TextField(
                  controller: controllerHargaBeli,
                  decoration: new InputDecoration(
                      hintText: "Harga Beli", labelText: "Harga Beli"),
                ),
                new TextField(
                  controller: controllerHargaJual,
                  decoration: new InputDecoration(
                      hintText: "Harga Jual", labelText: "Harga Jual"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new ElevatedButton(
                  onPressed: () {
                    //jika ditekan maka data akan bertambah
                    AddData();
                    //setelah klik AddData maka akan kembali ke halaman utama
                    //dan data baru akan muncul di halaman utama
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Home(),
                    ));
                  },
                  child: new Text("ADD DATA"),
                  style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor:
          Color.fromARGB(255, 252, 228, 194), //warna background pada body
    );
  }
}
