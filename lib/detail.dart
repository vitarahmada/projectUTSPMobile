import 'package:flutter/material.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class Detail extends StatefulWidget {
  //variabel untuk menampung nama obat yang di klik
  final list;
  final index;
  Detail({this.index, this.list});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    String url = "http://10.0.2.2:080/data_obat/deletedata.php";

    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Apakah Anda yakin untuk menghapus data '${widget.list[widget.index]['nama_obat']}'?"),
      actions: <Widget>[
        new ElevatedButton(
          onPressed: () {
            deleteData();
            //setelah klik tombol hapus, data akan terhapus dan kembali ke tampilan halaman utama
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Home(),
            ));
          },
          child: new Text("IYA"),
          style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
        ),
        new ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: new Text("BATAL"),
          style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Color.fromARGB(
              255, 230, 168, 87), //memberi warna background pada title appBar
          title: new Text("${widget.list[widget.index]['nama_obat']}")),
      backgroundColor:
          Color.fromARGB(255, 252, 228, 194), //warna background pada body
      body: new Container(
        height: 300.0,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: new Card(
          child: new Center(
              child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(top: 30.0),
              ),
              new Text(
                widget.list[widget.index]['nama_obat'],
                style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              new Text(""),
              new Text(
                "Kode Obat : ${widget.list[widget.index]['kode_obat']}",
                style: new TextStyle(fontSize: 15.0),
              ),
              new Text(
                "Satuan : ${widget.list[widget.index]['satuan']}",
                style: new TextStyle(fontSize: 15.0),
              ),
              new Text(
                "Stock : ${widget.list[widget.index]['jumlah_stok']}",
                style: new TextStyle(fontSize: 15.0),
              ),
              new Text(
                "Harga Beli : ${widget.list[widget.index]['harga_beli']}",
                style: new TextStyle(fontSize: 15.0),
              ),
              new Text(
                "Harga Jual : ${widget.list[widget.index]['harga_jual']}",
                style: new TextStyle(fontSize: 15.0),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 30.0),
              ),

              //membuat tombol edit dan delete
              new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ElevatedButton(
                    child: new Text("EDIT"),
                    style:
                        ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                    onPressed: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new EditData(
                        list: widget.list,
                        index: widget.index,
                      ),
                    )),
                  ),
                  new ElevatedButton(
                    child: new Text("DELETE"),
                    style:
                        ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                    onPressed: () => confirm(), //menjalankan method confirm
                  )
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
