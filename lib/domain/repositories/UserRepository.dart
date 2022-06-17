
import 'package:phononx_test/domain/models/user/User.dart';
import 'package:tuple/tuple.dart';

abstract class UserRepository {
  Future<Tuple3<bool, User?, String>> getUser(String username);
}