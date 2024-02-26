import 'dart:io';

class Post {
  final String text;
  final DateTime date;
  final String username;
  final File? image;
  final String imageurl;

  Post({
    required this.text,
    required this.date,
    required this.username,
    this.image,
    required this.imageurl,
  });
}

//投稿を格納するリストで、初期値として1つの投稿を持つ
List<Post> _posts = [
  //Post(text: "テスト", date: DateTime.now(), username: "Cocon", imageurl: "\"https://www.jetstar.com/_/media/images/japan-and-korea/japan/careers/mainvisual-pc.jpg?la=ja-jp\"")
];

void createPost(String text, DateTime date, String username, File? image, String imageurl) {
  _posts.add(Post(text: text, date: date, username: username, image: image, imageurl: imageurl,));
}

List<Post> getPosts() {
  return _posts;
}
