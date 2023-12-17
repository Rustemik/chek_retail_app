import 'package:chek_retail_app/Domain/Models/product-entity.dart';

abstract class ProductRepository {
  List<ProductEntity> getProducts();
}
