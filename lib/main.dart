import 'package:flutter/material.dart';
import 'product_detail.dart';

/// The main entry point for the app.
///
/// Called when the app is launched.
///
void main() {
  runApp(ProductApp());
}

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Pixel 1',
      'description': 'Pixel is the most featureful phone ever',
      'price': 800,
      'color': Colors.blue
    },
    {
      'name': 'Laptop',
      'description': 'Laptop is the most productive development tool',
      'price': 2000,
      'color': Colors.green
    },
    {
      'name': 'Tablet',
      'description': 'Tablet is the most useful device ever for meeting',
      'price': 1500,
      'color': Colors.orange
    },
    {
      'name': 'Pendrive',
      'description': 'iPhone is the stylist phone ever',
      'price': 100,
      'color': Colors.red
    },
    {
      'name': 'Floppy Drive',
      'description': 'iPhone is the classic storage device',
      'price': 50,
      'color': Colors.purple
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Navigation'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      name: product['name'],
                      description: product['description'],
                      price: product['price'],
                      color: product['color'],
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  // Left part with color and product name
                  Container(
                    color: product['color'],
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    child: Text(
                      product['name'],
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  // Right part with details
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(product['description']),
                          SizedBox(height: 8),
                          Text('Price: ${product['price']}'),
                          SizedBox(height: 8),
                          Row(
                            children: List.generate(3, (index) {
                              return Icon(Icons.star,
                                  size: 16, color: Colors.amber);
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
