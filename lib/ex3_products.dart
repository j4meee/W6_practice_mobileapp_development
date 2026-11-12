import 'package:flutter/material.dart';

// Store the information for each fixed product.
enum Product {
  dart('Dart', 'the best object language', 'assets/ex3/dart.png'),
  flutter('Flutter', 'the best mobile widget library', 'assets/ex3/flutter.png'),
  firebase('Firebase', 'the best cloud database', 'assets/ex3/firebase.png');

  final String title;
  final String description;
  final String image;

  const Product(this.title, this.description, this.image);
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.image,
              width: 90,
              height: 90,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(product.title, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 8),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        backgroundColor: Colors.blue,
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                ProductCard(product: Product.dart),
                SizedBox(height: 16),
                ProductCard(product: Product.flutter),
                SizedBox(height: 16),
                ProductCard(product: Product.firebase),
              ],
            ),
          ),
      ),
    ),
  );
}
