import 'package:chek_retail_app/Domain/Models/product-entity.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final amountName = product.amount is Grams ? "г" : "шт";

    // return Text(product.title);
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 68,
            width: 68,
            color: Colors.amberAccent,
          ),
          SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 68,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.title),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${product.amount.value} $amountName'),
                      Row(
                        children: [
                          if (product.sale > 0)
                            Text(
                              '${product.price} руб',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey),
                            ),
                          SizedBox(width: 16),
                          if (product.sale > 0)
                            Text(
                              '${product.price - product.sale} руб',
                              style: TextStyle(color: Colors.red),
                            )
                          else
                            Text(
                              '${product.price - product.sale} руб',
                            )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
