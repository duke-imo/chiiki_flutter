import 'package:flutter/material.dart';
import 'package:flutter_chiiki/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_chiiki/main.dart';
import 'package:flutter_chiiki/image_picker.dart';
import 'dart:io';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  _PostPagePageState createState() => _PostPagePageState();
}

class _PostPagePageState extends State<PostPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _usernameEditingController =
      TextEditingController();
  File? _selectedImage;

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
              maxLength: 150,
              style: const TextStyle(color: Colors.black),
              obscureText: false,
              maxLines: null,
              decoration: const InputDecoration(
                icon: Icon(Icons.speaker_notes),
                hintText: '投稿内容を記載します',
                labelText: '内容 * ',
              ),
            ),
            TextField(
              controller: _usernameEditingController,
              enabled: true,
              maxLength: 15,
              style: const TextStyle(color: Colors.black),
              obscureText: false,
              maxLines: 1,
              decoration: const InputDecoration(
                icon: Icon(Icons.speaker_notes),
                hintText: 'ユーザ名を入力してください',
                labelText: 'ユーザ名 * ',
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text("Pick Image from Gallery",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              onPressed: () {
                _pickImageFromGallery();
              },
            ),
            MaterialButton(
              color: Colors.red,
              child: const Text("Pick Image from Camera",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              onPressed: () {
                _pickImageFromCamera();
              },
            ),
             _selectedImage != null
                 ? Image.file(_selectedImage!)
                 : const Text("Please select an image")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();

          prefs.setString('saved_text', _textEditingController.text);
          prefs.setString('saved_username', _usernameEditingController.text);
          prefs.setString('saved_image', _selectedImage.toString());

          String savedText = prefs.getString('saved_text') ?? "No Data";
          String savedUsername = prefs.getString('saved_username') ?? "No Data";
          File? selectedImage = File(prefs.getString('saved_image') ?? "No Data");

          createPost(savedText, DateTime.now(), savedUsername, selectedImage);

          print(selectedImage.toString());

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

  Future _pickImageFromGallery() async {
    final pickedImage = await pickImageFromGallery();
    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
    }
  }

  Future _pickImageFromCamera() async {
    final pickedImage = await pickImageFromCamera();
    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
    }
  }
}
