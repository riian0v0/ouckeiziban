import 'package:a/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'ensou.dart';

class ensou2 extends StatefulWidget {
  const ensou2({Key? key}) : super(key: key);

  @override
  State<ensou2> createState() => _ensou2State();
}

class _ensou2State extends State<ensou2> {
  TextEditingController _textEditingController = TextEditingController();
  String contents = "";
  String namae = "";
  String twid = "";
  String isid = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("演奏")),
        body: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                icon: Icon(Icons.person),
                hintText: "名前を入力してください",
                labelText: "名前",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "必須です。";
                }
                return null;
              },
              onChanged: (name) {
                namae = name;
              },
            ),
            TextField(
              controller: _textEditingController,
              enabled: true,
              maxLength: 50, // 入力数 // 入力上限になったときに、文字入力を抑制するか
              style: TextStyle(color: Colors.black),
              obscureText: false,
              maxLines: 1,
              decoration: const InputDecoration(
                icon: Icon(Icons.speaker_notes),
                hintText: '投稿内容を記載します',
                labelText: '内容 * ',
              ),
              onChanged: (text) {
                contents = text;
              },
            ),
            TextField(
              enabled: true,
              maxLength: 50, // 入力数 // 入力上限になったときに、文字入力を抑制するか
              style: TextStyle(color: Colors.blue),
              obscureText: false,
              maxLines: 1,
              decoration: const InputDecoration(
                icon: Icon(Icons.alternate_email),
                hintText: '@マークは含めずに入力してください',
                labelText: 'Twitter ',
              ),
              onChanged: (twitter) {
                twid = twitter;
              },
            ),
            TextField(
              enabled: true,
              maxLength: 50, // 入力数 // 入力上限になったときに、文字入力を抑制するか
              style: TextStyle(color: Colors.pink),
              obscureText: false,
              maxLines: 1,
              decoration: const InputDecoration(
                icon: Icon(Icons.alternate_email),
                hintText: 'instagramのアカウントIDを記載してください',
                labelText: 'instagram',
              ),
              onChanged: (instagram) {
                isid = instagram;
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                    child: Text("submit"),
                    onPressed: () {
                      try {
                        FirebaseFirestore.instance.collection("ensou").add({
                          "name": namae,
                          "contents": contents,
                          "Twitter": twid,
                          "instagram": isid
                        });
                      } catch (e) {
                        print(e);
                      }
                      showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Hello"),
                              content: SingleChildScrollView(
                                child: Text("無事に提出されました"),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return ensou();
                                      },
                                      ),
                                    );
                                  }
                                )
                              ],
                            );
                          }
                        );
                    }))
          ],
        )
      );
  }
}