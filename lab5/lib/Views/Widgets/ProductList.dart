import 'package:exam/Entity/Product.dart';
import 'package:exam/Views/Widgets/ProductCard.dart';
import 'package:flutter/material.dart';

/// Layer danh sách sản phẩm - hiển thị dạng 1 cột (ListView)
class ProductListLayer extends StatelessWidget {
  final List<Product> products;

  const ProductListLayer({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: products.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) => SizedBox(
        height: 280,
        child: ProductCard(product: products[index]),
      ),
    );
  }
}

/// Layer danh sách sản phẩm - hiển thị responsive (GridView)
class ProductListResponsiveLayer extends StatelessWidget {
  final List<Product> products;

  const ProductListResponsiveLayer({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth <= 450 ? 1 : 2;
        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.75,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) =>
              ProductCard(product: products[index]),
        );
      },
    );
  }
}
