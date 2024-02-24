import 'dart:io';

class Post {
  final String text;
  final DateTime date;
  final String username;
  final File? image;

  Post({
    required this.text,
    required this.date,
    required this.username,
    this.image,
  });
}

//投稿を格納するリストで、初期値として1つの投稿を持つ
List<Post> _posts = [
  Post(text: "テスト", date: DateTime.now(), username: "Cocon")
];

void createPost(String text, DateTime date, String username, [File? image]) {
  _posts.add(Post(text: text, date: date, username: username, image: image));
}

List<Post> getPosts() {
  return _posts;
}
