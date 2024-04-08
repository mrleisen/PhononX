
import 'package:injectable/injectable.dart';

import 'search_users_by_page_use_case.dart';

@Injectable()
class UsersUseCases {

  SearchUsersByPageUseCase searchUsersByPage;

  UsersUseCases({
    required this.searchUsersByPage,
  });

}