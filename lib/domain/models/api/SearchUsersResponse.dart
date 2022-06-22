import 'package:phononx_test/domain/models/user/User.dart';

class SearchUsersResponse {

  int? totalCount;
  bool? incompleteResults;
  List<Item>? items;

  SearchUsersResponse({
    this.totalCount,
    this.incompleteResults,
    this.items
  });

  SearchUsersResponse.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
  }

  List<User> getUsers(){
    final users = <User>[];
    if(items != null){
      for (var item in items!) {
        users.add(item.getUser());
      }
    }
    return users;
  }

}

class Item {

  String? login;
  String? avatarUrl;

  Item({
    this.login,
    this.avatarUrl
  });

  Item.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
  }

  User getUser() => User(
      name: login ?? "",
      avatarUrl: avatarUrl ?? "",
      publicRepos: 0
  );

}