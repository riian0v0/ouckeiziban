import 'package:a/delivery.dart';
import 'package:a/douga.dart';
import 'package:a/douga2.dart';
import 'package:a/irasuto.dart';
import 'package:a/photo.dart';
import 'package:a/photo2.dart';
import 'package:a/report.dart';
import 'package:flutter/material.dart'; //No.39
import 'ensou.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//ここから 何だっけ
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAJxLI0t1ILbtUXE0Hng2WktKX4_toM2pw",
          authDomain: "keiziban-bd3ff.firebaseapp.com",
          projectId: "keiziban-bd3ff",
          storageBucket: "keiziban-bd3ff.appspot.com",
          messagingSenderId: "1052734478032",
          appId: "1:1052734478032:web:2492a226c98314bfdd30d5",
          measurementId: "G-P2BDRQLTEF"));
  runApp(MyApp());
}
//ここまでコピペ

class MyApp extends StatelessWidget {
  // This widget is the root of your application.ルートウィジェット
  //StatelessWidgetは状態を持たないウィジェット
  @override
  Widget build(BuildContext context) {
    //マテリアルデザインのためのウィジェット
    return MaterialApp(
      title: '商大生のスキルシェアリング',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //デザイン
      appBar: AppBar(
        title: Text("商大生のスキルシェアリング"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          children: [
            ListTile(
              title: Icon(Icons.brush, size: 100),
              subtitle: Text(
                "イラスト制作",
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return irasuto();
                }));
              },
            ),
            ListTile(
              title: Icon(Icons.piano, size: 100),
              subtitle: Text(
                "演奏",
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return ensou();
                  }),
                );
              },
            ),
            ListTile(
              title: Icon(Icons.photo_camera, size: 100),
              subtitle: Text(
                "写真撮影",
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return photo();
                }));
              },
            ),
            ListTile(
              title: Icon(Icons.movie_creation, size: 100),
              subtitle: Text(
                "動画制作",
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return douga();
                })));
              },
            ),
            ListTile(
              title: Icon(Icons.delivery_dining, size: 100),
              subtitle: Text(
                "デリバリー",
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return delivery();
                }));
              },
            ),
            ListTile(
              title: Icon(Icons.description, size: 100),
              subtitle: Text(
                "レポート監修",
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return report();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
