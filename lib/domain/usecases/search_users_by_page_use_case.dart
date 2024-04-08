
import 'package:injectable/injectable.dart';

import '../../base/async_response.dart';
import '../repositories/users_respository.dart';

@Injectable()
class SearchUsersByPageUseCase {

  UsersRepository _usersRepository;
  SearchUsersByPageUseCase(this._usersRepository);

  Future<AsyncResponse> launch(String query, int page)
    => _usersRepository.searchUsersWithRepoCount(query, page);

}