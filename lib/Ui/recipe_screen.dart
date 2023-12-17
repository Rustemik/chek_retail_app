import 'package:chek_retail_app/DataAccess/mock_product_repository.dart';
import 'package:chek_retail_app/DataAccess/interfaces/product_repository.dart';
import 'package:chek_retail_app/Domain/interfaces/product_service.dart';
import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  final ProductService _service;

  const RecipeScreen({super.key, required ProductService service})
      : _service = service;

  @override
  Widget build(BuildContext context) {
    final products = _service.getProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        itemBuilder: (context, index) => Text(products[index].title),
      ),
    );
  }
}
