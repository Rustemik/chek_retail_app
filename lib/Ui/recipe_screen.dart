import 'dart:developer';

import 'package:chek_retail_app/DataAccess/mock_product_repository.dart';
import 'package:chek_retail_app/DataAccess/interfaces/product_repository.dart';
import 'package:chek_retail_app/Domain/Models/product-entity.dart';
import 'package:chek_retail_app/Domain/interfaces/product_service.dart';
import 'package:chek_retail_app/Ui/product_card.dart';
import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  final ProductService _service;

  const RecipeScreen({super.key, required ProductService service})
      : _service = service;

  @override
  Widget build(BuildContext context) {
    final products = _service.getProducts();

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Column(
          children: [
            Text("Чек № 56"),
            // style: TextStyle(
            //     fontFamily: "Sora",
            //     fontWeight: FontWeight.w700,
            //     fontSize: 18,
            //     color: Colors.black),
            Text(
              "24.02.23 в 12:23",
              style: theme.appBarTheme.titleTextStyle!.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xff60607B),
              ),
            ),
            // style: TextStyle(
            //   fontFamily: "Sora",
            //   fontSize: 10,
            //   color: Colors.grey,
            // ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Color(0xFF67CD00),
          ),
        ),
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
                ),
                // style: TextStyle(
                //   fontSize: 18,
                //   fontWeight: FontWeight.w700,
                //   color: Color(0xFF252849),
                // ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(),
                      );
                    },
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
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "Каталог"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Поиск"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_mall), label: "Корзина"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Личное"),
        ],
      ),
    );
  }
}
