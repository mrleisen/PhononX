
import 'package:phononx_test/domain/models/user/User.dart';

abstract class HomeScreenContractView {
  showLoading();
  hideLoading();
  setUser(User user);
  showError(String errorMessage);
}

abstract class HomeScreenContractPresenter {
  attachView(HomeScreenContractView view);
  detachView();
  getUser(String username);
}