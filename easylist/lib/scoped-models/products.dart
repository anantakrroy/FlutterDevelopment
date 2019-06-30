import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';

mixin ProductModel on Model {
  List<Product> _products = [];
  int _selectedProdIndex;
  bool _showFavorites = false;

  List<Product> get products {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavorites) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selectedProdIndex;
  }

  Product get selectedProduct {
    if (_selectedProdIndex == null) {
      return null;
    }
    return _products[_selectedProdIndex];
  }

  bool get displayFavoritesOnly {
    return _showFavorites;
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectedProdIndex = null;
  }

  void updateProduct(Product product) {
    _products[_selectedProdIndex] = product;
    _selectedProdIndex = null;
  }

  void deleteProduct() {
    _products.removeAt(_selectedProdIndex);
    _selectedProdIndex = null;
  }

  void favoriteProduct() {
    final bool isFavorite = selectedProduct.isFavorite;
    final bool favoriteStatus = !isFavorite;
    final Product updatedProduct = Product(
      title: selectedProduct.title,
      description: selectedProduct.description,
      price: selectedProduct.price,
      image: selectedProduct.image,
      isFavorite: favoriteStatus,
    );
    _products[selectedProductIndex] = updatedProduct;
    notifyListeners();
    _selectedProdIndex = null;
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
    _selectedProdIndex = null;
  }

  void selectProduct(int index) {
    _selectedProdIndex = index;
  }
}
