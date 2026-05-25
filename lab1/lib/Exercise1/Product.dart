class Product {
  final String id;
  final String name;
  final String image;
  final double price;

  Product({required this.id, required this.name, required this.image, required this.price});

  Product copyTo({String? name, String? image, double? price})
  {
    return Product(id: id, name: name ?? this.name, image: image ?? this.image, price: price ?? this.price);
  }

  static List<Product> products = [
    Product(id: "P001", name: "iPhone 15", image: "assets/images/iphone15.png", price: 25000000),
    Product(id: "P002", name: "Samsung S24", image: "assets/images/s24.png", price: 22000000),
    Product(id: "P003", name: "Google Pixel 8", image: "assets/images/pixel8.png", price: 20000000),
    Product(id: "P004", name: "OnePlus 12", image: "assets/images/plus12.png", price: 18000000),
  ];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'].toDouble(),
    );
  }

  @override
  String toString() {
    return 'ID: $id - Name: $name - Price: $price';
  }
}

class ProductManager {

  void add(Product product) {
    bool isExist = Product.products.any((x) => x.id == product.id);
    if (isExist) {
      print("The product have ${product.id} already exists.");
      return;
    }
    Product.products.add(product);
  }

    void edit(Product updatedProduct) {
      int index = Product.products.indexWhere((p) => p.id == updatedProduct.id);

      if (index != -1) {
        Product.products[index] = updatedProduct;
      }
    }

  List<Product> search(String keyword) {
    return Product.products.where((p) =>
        p.name.toLowerCase().contains(keyword.toLowerCase())).toList();
  }

  Product? find(String id) {
    try {
      return Product.products.firstWhere((p) => p.id == id);
    } catch (e) { 
      return null;
    }
  }

  void sortByPrice(bool ascending) {
    Product.products.sort((a, b) {
      return ascending
          ? a.price.compareTo(b.price)
          : b.price.compareTo(a.price);
    });
  }

  void increasePrice() {
    Product.products = Product.products.map((p) => Product(
      id: p.id,
      name: p.name,
      image: p.image,
      price: p.price * 1.1,
    )).toList();
  }

  void showAll() {
    for (var p in Product.products) {
      print(p);
    }
  }
}

void main() {
  ProductManager manager = ProductManager();

  manager.add(Product(
      id: "P001", name: "iPhone 17 màu bạch kim", image: "iphone17.png", price: 2500));

  manager.add(Product(
      id: "P006", name: "Samsung S24 ultra", image: "s24.png", price: 2200));

  print("=== Product List ===");
  manager.showAll();

  print("\n=== Search 'iphone' ===");
  var result = manager.search("iphone");
  result.forEach(print);

  print("\n=== Find Product P001 ===");
  print(manager.find("P001"));

  manager.edit(Product(id: "P001", name: "iPhone 15 Pro", image: "iphone20.png", price: 3000));

  print("\n=== After Edit ===");
  manager.showAll();
  manager.increasePrice();

  print("\n=== After Increase Price 10% ===");
  manager.showAll();

  manager.sortByPrice(true);
  print("\n=== Ascending ===");
  manager.showAll();

  manager.sortByPrice(false);
  print("\n=== Descending ===");
  manager.showAll();
}