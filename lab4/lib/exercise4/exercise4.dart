import 'package:flutter/material.dart';

class Exercise4 extends StatelessWidget {
  const Exercise4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Thanh tiêu đề
      appBar: AppBar(
        title: const Text("Exercise 4 - Building Screen Structure using Scaffold"),
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),

      // 2. Menu ngăn kéo (Drawer)
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menu App", style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Trang chủ")),
            ListTile(leading: Icon(Icons.settings), title: Text("Cài đặt")),
          ],
        ),
      ),

      // 3. Thân bài
      body: const Center(
        child: Text("Nội dung chính nằm ở đây"),
      ),

      // 4. Nút nổi
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      // 5. Thanh điều hướng dưới cùng
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}