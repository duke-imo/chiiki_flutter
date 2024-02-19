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

List<Post> posts = [
  Post(text: "テスト", date: DateTime.now(), username: "Cocon")
];
