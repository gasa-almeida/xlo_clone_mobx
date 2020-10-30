import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_clone_mobx/models/user.dart';
import 'package:xlo_clone_mobx/repositories/table_keys.dart';

class UserRepository {

  Future<void> signUp(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set(keyUserType, user.type.index);

    await parseUser.signUp();
  }
  

}