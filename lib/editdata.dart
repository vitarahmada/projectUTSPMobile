import 'package:flutter/material.dart';
import './main.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final list;
  final index;
  EditData({this.list, this.index});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerKode = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerSatuan = TextEditingController();
  TextEditingController controllerStock = TextEditingController();
  TextEditingController controllerHargaBeli = TextEditingController();
  TextEditingController controllerHargaJual = TextEditingController();

  void editData() {
    String url = "http://10.0.2.2:080/data_obat/editdata.php";

    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      "kodeobat": controllerKode.text,
      "namaobat": controllerNama.text,
      "satuan": controllerSatuan.text,
      "stock": controllerStock.text,
      "hargabeli": controllerHargaBeli.text,
      "hargajual": controllerHargaJual.text
    });
  }

  @override
  void initState() {
    //mengisi controller dengan data
    controllerKode.text = widget.list[widget.index]['kode_obat'];
    controllerNama.text = widget.list[widget.index]['nama_obat'];
    controllerSatuan.text = widget.list[widget.index]['satuan'];
    controllerStock.text = widget.list[widget.index]['jumlah_stok'];
    controllerHargaBeli.text = widget.list[widget.index]['harga_beli'];
    controllerHargaJual.text = widget.list[widget.index]['harga_jual'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(
            255, 230, 168, 87), //memberi warna background pada title appBar
        title: new Text("EDIT DATA"),
      ),
      backgroundColor:
          Color.fromARGB(255, 252, 228, 194), //warna background pada bo
      body: Padding(
        padding: const EdgeInsets.all(15.0),
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
                    editData();
                    //setelah klik AddData maka akan kembali ke halaman utama
                    //dan data baru akan muncul di halaman utama
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new Home(),
                    ));
                  },
                  child: new Text("EDIT DATA"),
                  style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
