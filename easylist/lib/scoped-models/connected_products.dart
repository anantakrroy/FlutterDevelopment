import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../models/user.dart';

mixin ConnectedProducts on Model {
  List<Product> products = [];
  User authenticatedUser;
  int selProdIndex;

  void addProduct(
    String title, String description, String image, double price) {
    final Product newProduct = Product(
        title: title,
        description: description,
        price: price,
        image: image,
        emailID: authenticatedUser.email,
        userID: authenticatedUser.id);
    products.add(newProduct);
    selProdIndex = null;
    notifyListeners();
  }
}
