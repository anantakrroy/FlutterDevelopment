import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

class ProductModel extends Model {
  List<Product> _products = [];
  int _selectedProdIndex;

  List<Product> get products {
    return List.from(_products);
  }

  void addProduct(Product product) {
    print('PRODUCT MANAGER _addproduct');

    print('[PRODUCT MANAGER WIDGET] setState()');
    _products.add(product);
  }

  void updateProduct(Product product) {
    _products[_selectedProdIndex] = product;
  }

  void deleteProduct() {
    _products.removeAt(_selectedProdIndex);
  }

  void selectedProduct(int index) {
    _selectedProdIndex = index;
  }
}
