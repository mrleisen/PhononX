
import 'package:phononx_test/base/utilities/constants/ApiConstants.dart';
import 'package:phononx_test/data/api/ApiClient.dart';
import 'package:phononx_test/domain/datasources/UserApiDataSource.dart';
import 'package:phononx_test/domain/models/api/GetUserRequest.dart';
import 'package:phononx_test/domain/models/api/GetUserResponse.dart';
import 'package:phononx_test/domain/models/user/User.dart';
import 'package:tuple/tuple.dart';

class UserApiDataSourceImpl implements UserApiDataSource{

  final ApiClient _apiClient;

  UserApiDataSourceImpl(this._apiClient);

  @override
  Future<Tuple3<bool, User?, String>> getUser(String username) async {

    final getUserRequest = GetUserRequest(username: username);

    // asking the apiClient to start the get user call
    Tuple3<bool, GetUserResponse?, String> getUserResponseTuple = await _apiClient.getUser(getUserRequest);

    try{
      if(getUserResponseTuple.item1){ // checking if the response was succesful
        return Tuple3(true, getUserResponseTuple.item2!.getUser(), "");
      }else{
        return Tuple3(false, null, getUserResponseTuple.item3); // returning the error the error from the apiClient
      }
    }catch(error){
      return const Tuple3(false, null, ApiConstants.GET_USERS_FAILED_IN_DATA_SOURCE); // returning the error when it fails here
    }

  }

}