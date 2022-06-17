
import 'package:phononx_test/domain/models/user/User.dart';

class GetUserResponse {

  // if the api call to get users needs more properties, those properties should be added here
  String? name;
  String? avatarUrl;
  int? publicRepos;

  GetUserResponse({
    this.name,
    this.avatarUrl,
    this.publicRepos
  });

  GetUserResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatarUrl = json['avatar_url'];
    publicRepos = json['public_repos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['avatar_url'] = avatarUrl;
    data['public_repos'] = publicRepos;
    return data;
  }

  // this method is useful to get the user from the response
  User getUser() => User(
    name: name!,
    avatarUrl: avatarUrl!,
    publicRepos: publicRepos!
  );

}