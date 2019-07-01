import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import './connected_products.dart';

mixin ProductModel on ConnectedProducts {

  bool _showFavorites = false;

  List<Product> get myProducts {
    return List.from(products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(products);
  }

  int get selectedProductIndex {
    return selProdIndex;
  }

  Product get selectedProduct {
    if (selProdIndex == null) {
      return null;
    }
    return products[selectedProductIndex];
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  
  void updateProduct(String title, String description, String image, double price) {
    final Product updatedProduct = Product(
        title: title,
        description: description,
        price: price,
        image: image,
        emailID: selectedProduct.emailID,
        userID: selectedProduct.userID);
    products[selectedProductIndex] = updatedProduct;
    selProdIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    products.removeAt(selProdIndex);
    selProdIndex = null;
  }

  void favoriteProduct() {
    final bool isFavorite = selectedProduct.isFavorite;
    final bool favoriteStatus = !isFavorite;
    final Product updatedProduct = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      price: selectedProduct.price,
      image: selectedProduct.image,
      emailID: selectedProduct.emailID,
      userID: selectedProduct.userID,
      isFavorite: favoriteStatus,
    );
    products[selectedProductIndex] = updatedProduct;
    notifyListeners();
    selProdIndex = null;
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
    selProdIndex = null;
  }

  void selectProduct(int index) {
    selProdIndex = index;
  }
}
