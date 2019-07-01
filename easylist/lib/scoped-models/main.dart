import 'package:scoped_model/scoped_model.dart';

import 'package:easylist/scoped-models/products.dart';
import 'package:easylist/scoped-models/user.dart';
import './connected_products.dart';

class MainModel extends Model with ConnectedProducts, ProductModel, UserModel {} 