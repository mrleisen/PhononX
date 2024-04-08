
import '../../base/async_response.dart';

abstract class UsersRepository {
  Future<AsyncResponse> searchUsersWithRepoCount(String query, int page);
}