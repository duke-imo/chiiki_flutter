import 'package:flutter/material.dart';
import 'package:flutter_chiiki/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_chiiki/main.dart';

class PostPage extends StatefulWidget {

  @override
  _PostPagePageState createState() => _PostPagePageState();
}

class _PostPagePageState extends State<PostPage> {

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("投稿画面"),
      ),
      body: Center(
        child: TextField(
          controller: _textEditingController,
          enabled: true,
          maxLength: 50, 
          style: const TextStyle(color: Colors.black),
          obscureText: false,
          maxLines:1 ,
          decoration: const InputDecoration(
            icon: Icon(Icons.speaker_notes),
            hintText: '投稿内容を記載します',
            labelText: '内容 * ',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('saved_text', _textEditingController.text);

          String savedText = prefs.getString('saved_text') ?? "No Data";

          post(savedText, DateTime.now().toString(), "kato");

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage(title: 'chiiki_flutter')),
          );
        },
          child: const Icon(Icons.add),
        ),
      );
  }
}