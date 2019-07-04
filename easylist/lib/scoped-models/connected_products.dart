import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../models/user.dart';

mixin ConnectedProductsModel on Model {
  List<Product> _products = [];
  User _authenticatedUser;
  int selProdIndex;

  void addProduct(
    String title, String description, String image, double price) {
    final Product newProduct = Product(
        title: title,
        description: description,
        price: price,
        image: image,
        emailID: _authenticatedUser.email,
        userID: _authenticatedUser.id);
    _products.add(newProduct);
    selProdIndex = null;
    notifyListeners();
  }
}


mixin ProductModel on ConnectedProductsModel {

  bool _showFavorites = false;

  List<Product> get myProducts {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return selProdIndex;
  }

  Product get selectedProduct {
    if (selProdIndex == null) {
      return null;
    }
    return _products[selectedProductIndex];
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
    _products[selectedProductIndex] = updatedProduct;
    selProdIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(selProdIndex);
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
    _products[selectedProductIndex] = updatedProduct;
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



mixin UserModel on ConnectedProductsModel {

  User authenticatedUser;

  void login(String email, String password) {
    authenticatedUser = User(id: 'newUser', email: email, password: password);
  }
}

