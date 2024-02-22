import 'package:flutter/material.dart';
import 'package:flutter_chiiki/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_chiiki/main.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  _PostPagePageState createState() => _PostPagePageState();
}

class _PostPagePageState extends State<PostPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _usernameEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("投稿画面"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _textEditingController,
                  enabled: true,
                  maxLength: 50,
                  style: const TextStyle(color: Colors.black),
                  obscureText: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.speaker_notes),
                    hintText: '投稿内容を記載します',
                    labelText: '内容 * ',
                  ),
                ),
                TextField(
                  controller: _usernameEditingController,
                  enabled: true,
                  maxLength: 50,
                  style: const TextStyle(color: Colors.black),
                  obscureText: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.speaker_notes),
                    hintText: 'ユーザ名を入力してください',
                    labelText: 'ユーザ名 * ',
                  ),
                ),
              ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();

          prefs.setString('saved_text', _textEditingController.text);
          prefs.setString('saved_username', _usernameEditingController.text);

          String savedText = prefs.getString('saved_text') ?? "No Data";
          String savedUsername = prefs.getString('saved_username') ?? "No Data";

          createPost(savedText, DateTime.now(), savedUsername);

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const MyHomePage(title: 'chiiki_flutter')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
