import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  final String description;
  final int price;
  final Color color;

  const ProductDetailPage({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top section with product name
          Container(
            color: color,
            height: 200,
            alignment: Alignment.center,
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
          ),
          SizedBox(height: 16),
          // Details section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(description, style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Text('Price: $price', style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Row(
                  children: List.generate(3, (index) {
                    return Icon(Icons.star, size: 24, color: Colors.amber);
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
