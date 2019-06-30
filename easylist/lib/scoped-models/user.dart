import 'package:easylist/models/user.dart';
import 'package:scoped_model/scoped_model.dart';

mixin UserModel on Model {
  User login({String email, String password, String userID}) {
    return User(id: 'newUser', email: email, password: password);
  }
}
