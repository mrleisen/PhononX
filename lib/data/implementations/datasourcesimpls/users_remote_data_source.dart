import 'package:injectable/injectable.dart';
import '../../../base/async_response.dart';
import '../../../domain/datasources/users_remote_data_source.dart';
import '../../../domain/models/my_user.dart';
import '../../api/api_client.dart';

@Injectable(as: UsersRemoteDataSource)
class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final ApiClient _myHttpClient = ApiClient();

  UsersRemoteDataSourceImpl();

  @override
  Future<AsyncResponse> searchUsersByPage(String query, int page) async {
    try {
      final List<dynamic> responseData = await _myHttpClient.searchUsersByPage(query, page);
      if (responseData.isNotEmpty) {
        final users = responseData.map((e) => MyUser.fromJson(e)).toList();
        return Success(users);
      } else {
        return Error('No users found');
      }
    } catch (e) {
      return Error('Failed to load users, error: $e');
    }
  }

  @override
  Future<AsyncResponse> getUserReposCount(String username) async{
    try {
      final int responseData = await _myHttpClient.getUserReposCount(username);
      return Success(responseData);
    } catch (e) {
      return Error('Failed to load repos, error: $e');
    }
  }

}
