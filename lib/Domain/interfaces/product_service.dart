import 'package:chek_retail_app/Domain/Models/product-entity.dart';

abstract class ProductService {
  List<ProductEntity> getProducts();
}
