
import 'package:phononx_test/domain/models/user/User.dart';
import 'package:phononx_test/domain/repositories/UserRepository.dart';
import 'package:phononx_test/domain/usecases/userUseCases.dart';
import 'package:tuple/tuple.dart';

class UserUseCasesImpl implements UserUseCases {

  final UserRepository _userRepository;

  UserUseCasesImpl(this._userRepository);

  @override
  Future<Tuple3<bool, User?, String>> getUser(String username) async =>
      await _userRepository.getUser(username);

}