import 'package:chek_retail_app/DataAccess/mock_product_repository.dart';
import 'package:chek_retail_app/DataAccess/interfaces/product_repository.dart';
import 'package:chek_retail_app/Domain/Models/product-entity.dart';
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Список покупок",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF252849),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 32,
                    width: 32,
                    color: Color(0xFFF1F1F1),
                    child: Center(
                      child: Icon(
                        Icons.sort,
                        size: 24,
                        color: Color(0xFF60607B),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) =>
                    ProductCard(product: products[index]),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("В вашей покупке"),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("10 товаров"),
                    Text("7842 руб"),
                  ],
                ),
                SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Скидка 5%"),
                    Text("-300 руб"),
                  ],
                ),
                SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Итого"),
                    Text("7542 руб"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "a"),
          BottomNavigationBarItem(
              icon: Icon(Icons.baby_changing_station), label: "b"),
          BottomNavigationBarItem(icon: Icon(Icons.cabin), label: "c"),
          BottomNavigationBarItem(icon: Icon(Icons.dangerous), label: "d"),
        ],
      ),
    );
  }
}

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
