import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basit ToDo Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("ToDo Uygulaması"),
        centerTitle: true,
        leading: BackButton(),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Alarm Kuruldu !')));
            },
          ),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List alisverisListesi = [];

  elemanEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: alisverisListesi.length,
              itemBuilder: (context, siraNumarasi) => ListTile(
                subtitle: Text("Marketten Alınacaklar"),
                title: Text(alisverisListesi[siraNumarasi]),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
            child: TextField(
              controller: t1,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Unutmaman İçin Yazman Lazım :)',
              ),
            ),
          ),
          RaisedButton(
            onPressed: elemanEkle,
            child: Text("Ekle"),
          ),
          RaisedButton(
            onPressed: elemanCikar,
            child: Text("Çıkar"),
          ),
        ],
      ),
    );
  }
}