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

List<Post> posts = [//投稿を格納するリスト
  Post(text: "テスト", date: DateTime.now(), username: "Cocon")
];

String post(String text, String date, String username) {//投稿を追加する関数
  //   if (text.isEmpty || date.isEmpty || username.isEmpty) {
  //   throw ArgumentError("引数が不足しています");
  // }

  posts.add(Post(
    text: text,
    date: DateTime.now(),
    username: username
  ));
  return "投稿しました";
}