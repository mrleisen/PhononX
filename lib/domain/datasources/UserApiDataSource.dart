
import 'package:phononx_test/domain/models/user/User.dart';
import 'package:tuple/tuple.dart';

abstract class UserApiDataSource {
  Future<Tuple3<bool, User?, String>> getUser(String username);
  Future<Tuple3<bool, List<User>?, String>> searchUsers(String query);
}