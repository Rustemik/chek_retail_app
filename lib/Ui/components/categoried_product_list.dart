import 'package:chek_retail_app/Domain/Models/product-entity.dart';
import 'package:chek_retail_app/Ui/Components/product_card.dart';
import 'package:flutter/material.dart';

class CategoriedProductList extends StatelessWidget {
  const CategoriedProductList({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
