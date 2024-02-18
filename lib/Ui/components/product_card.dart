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
    final theme = Theme.of(context);

    // return Text(product.title);
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 68,
              width: 68,
              child: Image.network(
                fit: BoxFit.fill,
                product.imageUrl,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 68,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.title,
                    style: theme.textTheme.bodySmall,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.amount.value} $amountName',
                        style: theme.textTheme.bodySmall,
                      ),
                      Row(
                        children: [
                          if (product.sale > 0)
                            Text(
                              '${product.price} руб',
                              style: theme.textTheme.bodySmall?.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey),
                            ),
                          const SizedBox(width: 16),
                          if (product.sale > 0)
                            Text(
                              '${product.price - product.sale} руб',
                              style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700),
                            )
                          else
                            Text(
                              '${product.price - product.sale} руб',
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
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
