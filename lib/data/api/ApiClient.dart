
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:phononx_test/base/utilities/constants/ApiConstants.dart';
import 'package:phononx_test/domain/models/api/GetUserRequest.dart';
import 'package:phononx_test/domain/models/api/GetUserResponse.dart';
import 'package:phononx_test/domain/models/api/GetUserResponseError.dart';
import 'package:tuple/tuple.dart';

class ApiClient {

  Future<Tuple3<bool, GetUserResponse?, String>> getUser(GetUserRequest getUserRequest) async {

    final URL = Uri.parse("${ApiConstants.API_GET_USERS}"
        "${getUserRequest.username}"
    );

    print(URL);

    try{
      final response = await http.get(
          URL,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
          }
      );

      print("ApiClient getUser response: $response");
      print("ApiClient getUser response.statusCode: ${response.statusCode}");
      print("ApiClient getUser response.body: ${response.body}");

      if(response.statusCode == 200){
        GetUserResponse getUserResponse = GetUserResponse.fromJson(jsonDecode(response.body));
        return Tuple3(true, getUserResponse, "");
      }else if(response.statusCode == 404){
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