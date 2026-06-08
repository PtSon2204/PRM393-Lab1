import 'package:exam/Entity/Product.dart';
import 'package:exam/Views/Widgets/ProductList.dart';
import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  final List<Product> products;
  const Homepage({super.key, required this.products});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Center(child: Text('Home Page')),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/about'),
            icon: const Icon(Icons.account_box_outlined),
          ),
        ],
      ),
      body: [
        // Tab 0: Danh sách sản phẩm (responsive grid/list)
        ProductListResponsiveLayer(products: widget.products),
        // Tab 1: About
        const Center(child: Text('About')),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
