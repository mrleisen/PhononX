
import 'package:phononx_test/domain/models/user/User.dart';

// this class helps to connect (to present) the view to the presenter and viceversa

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