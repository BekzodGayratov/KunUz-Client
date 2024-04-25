import 'package:flutter/material.dart';
import 'package:kunuzclient/presentation/pages/screens/artice_screen.dart';
import 'package:kunuzclient/presentation/pages/screens/main_screen.dart';
import 'package:kunuzclient/presentation/pages/screens/media_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kun.Uz"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: const [MainScreen(), ArticleScreen(), MediaScreen()]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Asosiy"),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: "Maqola"),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline), label: "Media"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _tabController.animateTo(index);
        },
      ),
    );
  }
}
