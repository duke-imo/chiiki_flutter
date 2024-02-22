class Post {
  final String text;
  //final List<int> imageBytes;
  final DateTime date;
  final String username;

  Post({
    required this.text,
    //required this.imageBytes,
    required this.date,
    required this.username,
  });
}

//投稿を格納するリストで、初期値として1つの投稿を持つ
List<Post> posts = [Post(text: "テスト", date: DateTime.now(), username: "Cocon")];

void createPost(String text, DateTime date, String username) {
  //   if (text.isEmpty || date.isEmpty || username.isEmpty) {
  //   throw ArgumentError("引数が不足しています");
  // }
  posts.add(Post(text: text, date: date, username: username));
}
