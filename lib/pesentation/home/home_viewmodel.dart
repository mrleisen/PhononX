import 'package:flutter/material.dart';

import '../../base/async_response.dart';
import '../../domain/models/my_user.dart';
import '../../domain/usecases/users_use_cases.dart';

class HomeViewModel extends ChangeNotifier {

  UsersUseCases _usersUseCases;
  HomeViewModel(this._usersUseCases);

  AsyncResponse _searchUsersResponse = Init();
  AsyncResponse get searchUsersResponse => _searchUsersResponse;

  AsyncResponse _loadMoreUsersResponse = Init();
  AsyncResponse get loadMoreUsersResponse => _loadMoreUsersResponse;

  List<MyUser> _users = [];
  List<MyUser> get users => _users;

  int _page = 1;
  int get page => _page;

  Future<void> searchUsersByPage(String query) async {
    _searchUsersResponse = Loading();
    notifyListeners();

    try {
      _page = 1;
      final users = await _searchUsersByPage(query, _page);
      if (users != null) {
        _searchUsersResponse = Init();
        _users = users;
      } else {
        _searchUsersResponse = Error('No users found');
      }
    } catch (e) {
      _searchUsersResponse = Error('Failed to search users, error: $e');
    }
    notifyListeners();
  }

  Future<void> loadMoreUsers(String query) async {

    if (_loadMoreUsersResponse is Loading) {
      return;
    }

    _loadMoreUsersResponse = Loading();
    notifyListeners();

    try {
      _page++;
      final users = await _searchUsersByPage(query, _page);
      if (users != null) {
        _loadMoreUsersResponse = Init();
        _users.addAll(users);
      } else {
        _loadMoreUsersResponse = Error('No more users found');
      }
    } catch (e) {
      _loadMoreUsersResponse = Error('Failed to load more users, error: $e');
    }
    notifyListeners();
  }

  Future<List<MyUser>?> _searchUsersByPage(String query, int page) async {
    final response = await _usersUseCases.searchUsersByPage.launch(query, page);
    if (response is Success) {
      return response.data as List<MyUser>;
    }
    return null;
  }

}
