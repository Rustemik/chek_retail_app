import 'package:chek_retail_app/Domain/Models/product-entity.dart';
import 'package:chek_retail_app/Domain/Models/sort_type.dart';

abstract class ProductService {
  List<ProductEntity> getProducts(SortTypes sortType);
}
