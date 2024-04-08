
import 'package:injectable/injectable.dart';

import '../../../base/async_response.dart';
import '../../../domain/datasources/users_remote_data_source.dart';
import '../../../domain/models/my_user.dart';
import '../../../domain/repositories/users_respository.dart';

@Injectable(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {

  final UsersRemoteDataSource _remoteDataSource;

  UsersRepositoryImpl(this._remoteDataSource);

  @override
  Future<AsyncResponse> searchUsersWithRepoCount(String query, int page) async {
    final response = await _remoteDataSource.searchUsersByPage(query, page);
    if (response is Success) {
      final users = response.data as List<MyUser>;
      for (var user in users) {
        final response = await _remoteDataSource.getUserReposCount(user.login);
        if (response is Success) {
          final repoCount = response.data as int;
          user.publicRepos =repoCount;
        } else {
          user.publicRepos = 0;
        }
      }
      return Success(users);
    } else {
      return response;
    }
  }


}