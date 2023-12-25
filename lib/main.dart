import 'package:chek_retail_app/DataAccess/interfaces/product_repository.dart';
import 'package:chek_retail_app/DataAccess/mock_product_repository.dart';
import 'package:chek_retail_app/Ui/recipe_screen.dart';
import 'package:chek_retail_app/Domain/interfaces/product_service.dart';
import 'package:chek_retail_app/Domain/product_service_impl.dart';
import 'package:chek_retail_app/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ProductRepository repo = MockProductRepository();
    ProductService service = ProductServiceImpl(repo);

    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: RecipeScreen(
        service: service,
      ),
    );
  }
}
