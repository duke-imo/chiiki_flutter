class Data {
  final String text;
  //final List<int> imageBytes;
  final DateTime date;
  final String username;

  Data({
    required this.text, 
    //required this.imageBytes,
    required this.date,
    required this.username,
  });
}

List<Data> datalist = [
  Data(text: "テスト", date: DateTime.now(), username: "Cocon")
];
