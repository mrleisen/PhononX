
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:phononx_test/base/utilities/constants/ApiConstants.dart';
import 'package:phononx_test/domain/models/api/GetUserRequest.dart';
import 'package:phononx_test/domain/models/api/GetUserResponse.dart';
import 'package:phononx_test/domain/models/api/GetUserResponseError.dart';
import 'package:phononx_test/domain/models/api/SearchUsersResponse.dart';
import 'package:phononx_test/domain/models/api/SearchUsersRequest.dart';
import 'package:phononx_test/domain/models/api/SearchUsersResponseError.dart';
import 'package:tuple/tuple.dart';

class ApiClient {

  // this method returns a future with a boolean that tells the successful request, a getUserResponse with the actual response of the api
  // and a string if the request fails
  Future<Tuple3<bool, SearchUsersResponse?, String>> searchUsers(SearchUsersRequest searchUserRequest) async {

    // this is the url
    final URL = Uri.parse("${ApiConstants.API_SEARCH_USERS}"
        "${searchUserRequest.query}${searchUserRequest.IN_LOGIN}"
    );

    // implementing a try catch in order to catch any error trying in the request and decoding the response
    try{
      final response = await http.get(
          URL,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
          }
      );

      if(response.statusCode == 200){ // status code 200 means the request was successful
        // converting the response to JSON first an then to a searchUsersResponse object
        SearchUsersResponse searchUsersResponse = SearchUsersResponse.fromJson(jsonDecode(response.body));
        return Tuple3(true, searchUsersResponse, "");
      }else if(response.statusCode == 404){ // status code 404 means that the api request failed and it contains an message
        SearchUsersResponseError searchUserResponseError = SearchUsersResponseError.fromJson(jsonDecode(response.body));
        return Tuple3(false, null, searchUserResponseError.message!);
      }else{
        return Tuple3(false,  null, "${response.statusCode}"); // returning status code related to errors
      }
    }catch(error){
      return const Tuple3(false,  null, ApiConstants.API_SEARCH_USERS_FAILED);  // unknown error
    }

  }

  // this method returns a future with a boolean that tells the successful request, a getUserResponse with the actual response of the api
  // and a string if the request fails
  Future<Tuple3<bool, GetUserResponse?, String>> getUser(GetUserRequest getUserRequest) async {

    // this is the url with the parameter username
    final URL = Uri.parse("${ApiConstants.API_GET_USERS}"
        "${getUserRequest.username}"
    );

    // implementing a try catch in order to catch any error trying in the request and decoding the response
    try{
      final response = await http.get(
          URL,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
          }
      );

      if(response.statusCode == 200){ // status code 200 means the request was successful
        // converting the response to JSON first an then to a getUserResponse object
        GetUserResponse getUserResponse = GetUserResponse.fromJson(jsonDecode(response.body));
        return Tuple3(true, getUserResponse, "");
      }else if(response.statusCode == 404){ // status code 404 means that the api request failed and it contains an message
        GetUserResponseError getUserResponseError = GetUserResponseError.fromJson(jsonDecode(response.body));
        return Tuple3(false, null, getUserResponseError.message!);
      }else{
        return Tuple3(false,  null, "${response.statusCode}"); // returning status code related to errors
      }
    }catch(error){
      return const Tuple3(false,  null, ApiConstants.API_GET_USERS_FAILED);  // unknown error
    }

  }

}