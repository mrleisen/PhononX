
import 'package:phononx_test/domain/models/user/User.dart';

// this class helps to connect (to present) the view to the presenter and viceversa

abstract class HomeScreenContractView {
  showLoading();
  hideLoading();
  showError(String errorMessage);
  setUsers(List<User> users);
}

abstract class HomeScreenContractPresenter {
  attachView(HomeScreenContractView view);
  detachView();
  searchUsers(String query);
  Future<User> getUser(User user);
}