import 'package:a/delivery2.dart';
import 'package:a/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class delivery extends StatefulWidget {
  const delivery({Key? key}) : super(key: key);

  @override
  State<delivery> createState() => _deliveryState();
}

class _deliveryState extends State<delivery> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection("delivery").get(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            QuerySnapshot qs = snapshot.data as QuerySnapshot;
            List<Widget> tiles = [];
            for (var d in qs.docs) {
              tiles.add(ListTile(
                title: Text(d.get("name")),
                subtitle: Text(d.get("contents")),
                trailing: Wrap(
                  spacing: 12,
                  children:<Widget>[
                    ElevatedButton(
                      child: const Text("Twitter"),
                      style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                      final url = Uri.parse("https://twitter.com/" + d.get("Twitter"));
                      await launchUrl(url);
                      },
                    ),
                    ElevatedButton(
                      child: const Text("instagram"),
                      style: ElevatedButton.styleFrom(
                      primary: Colors.pink,
                      onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                      final url = Uri.parse("https://www.instagram.com/" + d.get("instagram") + "/");
                      await launchUrl(url);
                      },
                    ),
                  ]
                ) 
              ));
            }
            return Scaffold(
              appBar: AppBar(title: const Text("デリバリー")),
              body: ListView(children: tiles),
              floatingActionButton: IconButton(
                icon: Icon(Icons.edit),

                /// ==ここから追加==
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return delivery2();
                  }));

                  /// ==ここまで追加==
                },
              ),
            );
          } else {
            return Scaffold(
              body: Center(child: Text("読み込み中です")),
            );
          }
          
        }));
  }
}
