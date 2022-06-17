
import 'package:phononx_test/domain/datasources/UserApiDataSource.dart';
import 'package:phononx_test/domain/models/user/User.dart';
import 'package:phononx_test/domain/repositories/UserRepository.dart';
import 'package:tuple/tuple.dart';

class UserRepositoryImpl implements UserRepository{

  late UserApiDataSource _userApiDataSource;

  UserRepositoryImpl(
    UserApiDataSource userApiDataSource
  ){
    _userApiDataSource = userApiDataSource;
  }

  @override
  Future<Tuple3<bool, User?, String>> getUser(String username) async {

    final resultTuple = await _userApiDataSource.getUser(username);
    if(resultTuple.item1){
      return Tuple3(true, resultTuple.item2!, "");
    }else{
      return Tuple3(false, null, resultTuple.item3);
    }
  }

}