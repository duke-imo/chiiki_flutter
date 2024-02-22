import 'package:flutter/material.dart';
import 'package:flutter_chiiki/post.dart';
import 'database.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Z',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'chiiki_flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: const Color.fromARGB(255, 34, 34, 34),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/image/icon_image.png'),
                  backgroundColor: Colors.transparent,
                  ),
                title: Text(
                  posts[index].text,
                  style: const TextStyle(color: Colors.white),
                  ),
                subtitle: Text(
                  DateFormat('yyyy/HH:mm').format(posts[index].date),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 167, 167, 167),
                    fontSize: 12,),
                  ),
                trailing: Text(
                  posts[index].username,
                  style: const TextStyle(color: Color.fromARGB(255, 110, 110, 110)),),
              ),
            );
        },
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 29, 29, 29)
              ),
              child: Center( 
              child: Text(
                'Nothing?!',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,)
                  ),
            ),
            ),
            ListTile(
              title: const Text(
                '投稿',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const PostPage()),);
              },
            ),
            ListTile(
              title: const Text(
                'ホーム',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const PostPage()),
              );
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
              ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Colors.white,),
            label: '',
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('𝕫'),
        titleTextStyle: const TextStyle(
          fontSize: 40,
        ),
        centerTitle: true,
        
      ), 
    );
  }
}
