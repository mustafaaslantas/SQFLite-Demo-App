import 'package:flutter/material.dart';
import 'database.dart';
import 'kisi.dart';
import 'liste.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Kisi>? liste;
  var idC = TextEditingController();
  var adC = TextEditingController();
  var sozC = TextEditingController();

  void sec(index) {
    idC.text = liste![index].id.toString();
    adC.text = liste![index].ad!;
    sozC.text = liste![index].soz!;
  }
  void listele() async {
    liste = await Db.getAll();
    setState(() {});
  }

  void ekle() {
    Db.ekle(Kisi(int.parse(idC.text), adC.text, sozC.text));
    idC.clear();
    adC.clear();
    sozC.clear();
    setState(() {});
  }

  void guncelle() {
    Db.update(Kisi(int.parse(idC.text), adC.text, sozC.text));
    setState(() {});
  }

  void sil() {
    Db.sil(int.parse(idC.text));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    listele();
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(hintText: "id"),
              controller: idC,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(hintText: "Ad"),
              controller: adC,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(hintText: "Söz"),
              controller: sozC,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: ekle,
                  child: const Text("Ekle"),
                ),
                ElevatedButton(
                  onPressed: sil,
                  child: const Text("Sil"),
                ),
                ElevatedButton(
                  onPressed: guncelle,
                  child: const Text("Güncelle"),
                ),
              ],
            ),
          ),
          Liste(liste,sec),
        ],
      ),
    );
  }
}