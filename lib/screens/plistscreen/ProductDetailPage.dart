import 'package:flutter/material.dart';
import 'package:elanera/screens/plistscreen/model/product_model.dart';


class ProductDetailPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(product.image, height: 200)),
            const SizedBox(height: 16),
            Text(product.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('\$${product.price}', style: const TextStyle(fontSize: 18, color: Colors.green)),
            const SizedBox(height: 16),
            Text(product.description),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                Text('${product.rating.rate}'),
                const SizedBox(width: 8),
                Text('(${product.rating.count} reviews)'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}