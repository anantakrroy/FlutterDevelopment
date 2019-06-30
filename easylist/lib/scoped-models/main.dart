import 'package:easylist/scoped-models/products.dart';
import 'package:easylist/scoped-models/user.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with ProductModel,UserModel {}