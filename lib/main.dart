import 'package:flutter/material.dart';
import 'package:news_books_app/data_controller.dart';
import 'package:news_books_app/pages/books_list.dart';
import 'package:news_books_app/pages/news_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsController newsController = NewsController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: index == 0 ? Colors.black : Colors.white,
      body: SafeArea(child: index == 0 ? const BooksList() : const NewsPage()),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          onTap: (s) {
            index = s;
            setState(() {});
          },
          backgroundColor: Colors.white,
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Books'),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper),
                label: 'News',
                backgroundColor: Colors.black),
          ]),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
