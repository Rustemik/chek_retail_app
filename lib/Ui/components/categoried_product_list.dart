import 'package:chek_retail_app/Domain/Models/product-entity.dart';
import 'package:chek_retail_app/Ui/Components/plain_product_list.dart';
import 'package:chek_retail_app/Ui/Components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class CategoriedProductList extends StatelessWidget {
  const CategoriedProductList({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final groups = groupBy(products, (c) {
      return c.category.name;
    });

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        String key = groups.keys.elementAt(index);
        final group = groups[key];
        final isLastItem = index == groups.length - 1;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              key,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            ...group!.map((e) => ProductCard(product: e)),
            if (!isLastItem) ...[
              Divider(),
              SizedBox(height: 20),
            ],
          ],
        );
      },
    );
  }
}
