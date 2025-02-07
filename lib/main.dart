import 'package:flutter/material.dart';

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
  final List<Map<String, String>> products = [
    {'name': 'Pixel 1', 'description': 'Pixel is the most phone ever', 'price': '800', 'color': 'blue'},
    {'name': 'Laptop', 'description': 'Laptop is the most productive development tool', 'price': '2000', 'color': 'green'},
    {'name': 'Tablet', 'description': 'Tablet is the most useful device ever for meeting', 'price': '1500', 'color': 'yellow'},
    {'name': 'Pen Drive', 'description': 'One of the stylish pen drive ever', 'price': '100', 'color': 'red'},
    {'name': 'Floppy Drive', 'description': 'Old but gold storage device', 'price': '50', 'color': 'grey'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Navigation')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(product: product),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              color: getColor(product['color']!),
              child: Text(
                product['name']!,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Map<String, String> product;

  ProductDetailPage({required this.product});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['name']!)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product['name']!,
              style: TextStyle(fontSize: 32, color: getColor(product['color']!)),
            ),
            SizedBox(height: 16),
            Text(product['description']!, style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Price: ${product['price']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }      // scaffold ends
}

Color getColor(String color) {
  switch (color) {
    case 'blue':
      return Colors.blue;
    case 'green':
      return Colors.green;
    case 'yellow':
      return Colors.yellow;
    case 'red':
      return Colors.red;
    case 'grey':
      return Colors.grey;
    default:
      return Colors.white;
  }
}


