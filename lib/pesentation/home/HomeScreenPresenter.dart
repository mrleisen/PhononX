
import 'dart:async';
import 'package:phononx_test/domain/models/user/User.dart';
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
    _view = view;
  }

  @override
  detachView() {
    _view = null;
  }

  @override
  searchUsers(String query) async {

    _view?.showLoading();
    final usersResult = await _userUseCases.searchUsers(query);
    if(usersResult.item1){
      if(_isViewAttached()){
        _view?.hideLoading();
        _view?.setUsers(usersResult.item2!);
      }
    }else{
      _view?.hideLoading();
      _view?.showError(usersResult.item3);
    }
  }

  @override
  Future<User> getUser(User user) async {
    final userResult = await _userUseCases.getUser(user.name);
    if(userResult.item1){
      return userResult.item2!;
    }
    return user;
  }

  // private functions
  bool _isViewAttached() => _view != null;

}