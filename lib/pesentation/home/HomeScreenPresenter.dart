
import 'package:phononx_test/base/utilities/constants/ApiConstants.dart';
import 'package:phononx_test/domain/usecases/userUseCases.dart';
import 'package:phononx_test/pesentation/home/HomeScreenContract.dart';

class HomeScreenPresenter implements HomeScreenContractPresenter {

  late UserUseCases _userUseCases;
  HomeScreenContractView? _view;

  HomeScreenPresenter(
    UserUseCases userUseCases
  ){
    _userUseCases = userUseCases;
  }

  @override
  attachView(HomeScreenContractView view) {
    this._view = view;
  }

  @override
  detachView() {
    _view = null;
  }

  @override
  getUser(String username) async {

    _view?.showLoading();
    final userResult = await _userUseCases.getUser(username);
    if(userResult.item1){
      if(_isViewAttached()){
        _view?.hideLoading();
        _view?.setUser(userResult.item2!);
      }
    }else{
      _view?.hideLoading();
      _view?.showError(userResult.item3);
    }
  }

  // private functions
  bool _isViewAttached() => _view != null;

}