import 'package:flutter/material.dart';

class Exercise3 extends StatelessWidget {
  const Exercise3({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Composition (Column, Row, Padding, ListView)'),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Center(
              child: Text(
                'Now Playing',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Hiện ra 10 dòng để test
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.star, color: Colors.orange), // Icon đại diện
                    title: Text("Item thứ $index"),
                    subtitle: Text("Test list view"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}