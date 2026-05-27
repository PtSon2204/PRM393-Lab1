import 'package:flutter/material.dart';

class Exercise5 extends StatefulWidget {
  const Exercise5({super.key});

  @override
  State<Exercise5> createState() => _Exercise5State();
}

class _Exercise5State extends State<Exercise5> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    // Thay vì dùng MaterialApp, ta dùng Widget Theme để bọc nội dung
    // Nó sẽ "ghi đè" theme của main cho riêng màn hình này
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exercise 5: Theme & UI Fixes'),
          actions: [
            const Icon(Icons.light_mode),
            Switch(
              value: _isDarkMode,
              onChanged: (val) => setState(() => _isDarkMode = val),
            ),
            const Icon(Icons.dark_mode),
          ],
        ),
        // Dùng SingleChildScrollView để FIX lỗi tràn màn hình khi có nhiều nội dung
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                '1. Theme Demo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Demo trạng thái sáng tối'),
                ),
              ),
              const SizedBox(height: 30),

              const Text(
                '2. Fix UI Error: Overflow',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Minh họa Row bị tràn và cách dùng Expanded để fix
              Row(
                children: [
                  Container(width: 50, height: 50, color: Colors.red),
                  const SizedBox(width: 10),
                  // Dùng Expanded để Text tự động xuống dòng, tránh lỗi gạch chéo vàng đen
                  const Expanded(
                    child: Text(
                      'Đây là đoạn văn bản rất dài, nếu không bọc trong Expanded nó sẽ gây ra lỗi Overflown. Đây là đoạn văn bản rất dài, nếu không bọc trong Expanded nó sẽ gây ra lỗi Overflown. Đây là đoạn văn bản rất dài, nếu không bọc trong Expanded nó sẽ gây ra lỗi Overflown. Đây là đoạn văn bản rất dài, nếu không bọc trong Expanded nó sẽ gây ra lỗi Overflown.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),

              // Tạo một khoảng trống lớn để test tính năng cuộn (Scroll)
              Container(height: 800, width: double.infinity,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.blue, Colors.purple.shade200]),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(child: Text("Test scroll")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}