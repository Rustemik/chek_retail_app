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
      // TODO: Handle this case.
      case SortTypes.byPriceAcc:
      // TODO: Handle this case.
      case SortTypes.byPriceDec:
      // TODO: Handle this case.
      case SortTypes.byTypeAcc:
      // TODO: Handle this case.
      case SortTypes.byTypeDec:
      // TODO: Handle this case.
    }
    return product;
  }
}
