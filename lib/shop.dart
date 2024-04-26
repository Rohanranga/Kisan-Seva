import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Product {
  final String name;
  final String description;
  final int amount;
  final String imagePath;

  Product({required this.name, required this.description, required this.amount, required this.imagePath});
}

class Shop extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Fertilizer',
      description: 'Organic fertilizer for healthy plants',
      amount: 5000, // ₹5
      imagePath: 'assets/images/ferti.webp',
    ),
    Product(
      name: 'Insecticides',
      description: 'Insecticides to keep your garden clean',
      amount: 3000, // ₹3
      imagePath: 'assets/images/insect.jpeg',
    ),
    Product(
      name: 'Pesticides',
      description: 'Pesticides to protect your plants',
      amount: 4000, // ₹4
      imagePath: 'assets/images/pest.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop', style: TextStyle(color: Colors.white)), // Change app bar title to "Shop" and set text color to white
        backgroundColor: Colors.green, // Set app bar background color to green
        iconTheme: IconThemeData(color: Colors.white), // Set back arrow color to white
        actions: [
          IconButton(
            onPressed: () {
              // Add your cart icon action here
            },
            icon: Icon(Icons.shopping_cart, color: Colors.white), // Set cart icon color to white
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              child: ListTile(
                leading: Image.asset(
                  products[index].imagePath,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  products[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(products[index].description),
                trailing: Text(
                  '₹${products[index].amount}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                onTap: () => _openCheckout(context, products[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  void _openCheckout(BuildContext context, Product product) async {
    var options = {
      'key': 'rzp_test_hoTNZlS83wp135', // Replace with your Razorpay API key
      'amount': product.amount * 10, // Convert amount to smallest currency unit
      'name': 'Make Payment',
      'description': product.description,
      'prefill': {'contact': '1234567890', 'email': 'example@example.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      Razorpay().open(options);
    } catch (e) {
      print('Error: $e');
    }
  }
}
