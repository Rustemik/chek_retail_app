import 'package:chek_retail_app/DataAccess/interfaces/product_repository.dart';
import 'package:chek_retail_app/Domain/Models/product-entity.dart';
import 'package:chek_retail_app/Domain/Models/sort_type.dart';
import 'package:chek_retail_app/Domain/interfaces/product_service.dart';

class ProductServiceImpl implements ProductService {
  ProductRepository _repo;

  ProductServiceImpl(this._repo);

  @override
  List<ProductEntity> getProducts(SortTypes sortType) {
    final product = _repo.getProducts();
    switch (sortType) {
      case SortTypes.noSort:
        return product;
      case SortTypes.byNameAcc:
        product.sort((a, b) => a.title.compareTo(b.title));
        return product;
      case SortTypes.byNameDec:
        product.sort((a, b) => b.title.compareTo(a.title));
      case SortTypes.byPriceAcc:
        product.sort((a, b) => a.price.compareTo(b.price));
        return product;
      case SortTypes.byPriceDec:
        product.sort((a, b) => b.price.compareTo(a.price));
        return product;
      case SortTypes.byTypeAcc:
        product.sort((a, b) => a.category.name.compareTo(a.category.name));
        return product;
      case SortTypes.byTypeDec:
        product.sort((a, b) => b.category.name.compareTo(a.category.name));
        return product;
    }
    return product;
  }
}
