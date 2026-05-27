import 'package:flutter/material.dart';

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Exercise 1: Image, Text, Icon, Card, ListTile'),
        elevation: 0,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            const Icon(
              Icons.image_aspect_ratio,
              color: Colors.blue,
              size: 100,
            ),

            const SizedBox(height: 24),

            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                height: 300,
                width: double.infinity,
                child: Center( // Bọc Center ở đây
                  child: Image.asset(
                    "assets/images/monkey.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: const Color(0xFFF5F5F5),
              child: const ListTile(
                leading: Icon(Icons.star, color: Colors.black54),
                title: Text(
                  'Image Monkey',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('This is a sample ListTile inside a Card.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}