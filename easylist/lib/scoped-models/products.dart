import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductModel extends Model {
  List<Product> _products = [];

  List<Product> get products {
    return List.from(_products);
  }

  void addProduct(Product product) {
    print('PRODUCT MANAGER _addproduct');

    print('[PRODUCT MANAGER WIDGET] setState()');
    _products.add(product);
  }

  void updateProduct(Product product, int index) {
    _products[index] = product;
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
  }
}
