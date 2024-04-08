
import '../../base/async_response.dart';

abstract class UsersRemoteDataSource {
  Future<AsyncResponse> searchUsersByPage(String query, int page);
  Future<AsyncResponse> getUserReposCount(String username);
}