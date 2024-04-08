import 'package:flutter/material.dart';

import '../../base/async_response.dart';
import '../../domain/models/my_user.dart';
import '../../domain/usecases/users_use_cases.dart';

class HomeViewModel extends ChangeNotifier {
  UsersUseCases _usersUseCases;
  HomeViewModel(this._usersUseCases);

  AsyncResponse _searchUsersResponse = Init();
  AsyncResponse get searchUsersResponse => _searchUsersResponse;

  List<MyUser> _users = [];
  List<MyUser> get users => _users;

  int _page = 1;
  int get page => _page;

  Future<void> searchUsersByPage(String query) async {

    _searchUsersResponse = Loading();
    notifyListeners();

    try {
      _searchUsersResponse = await _usersUseCases.searchUsersByPage.launch(query, _page);
      if (_searchUsersResponse is Success) {
        final success = _searchUsersResponse as Success;
        _users = success.data as List<MyUser>;
        notifyListeners();
      } else if (_searchUsersResponse is Error) {
        _users = [];
        notifyListeners();
      }
    } catch (e) {
      _users = [];
      _searchUsersResponse = Error('Failed to load users, error: $e');
      notifyListeners();
    }
  }

}
