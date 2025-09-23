import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final Color color;

  Product({required this.id, required this.name, required this.price, required this.color});
}

final List<Product> PRODUCTS = [
  Product(id: 0, name: 'Laptop', price: 999.99, color: Colors.amber),
  Product(id: 1, name: 'Smartphone', price: 699.99, color: Colors.red),
  Product(id: 2, name: 'Wireless Earbuds', price: 129.99, color: Colors.green),
  Product(id: 3, name: 'Smartwatch', price: 199.99, color: Colors.blue),
];