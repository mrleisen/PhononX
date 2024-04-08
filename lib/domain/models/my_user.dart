class MyUser {
  String login;
  String avatarUrl;
  int publicRepos;

  MyUser({
    required this.login,
    required this.avatarUrl,
    required this.publicRepos,
  });

  static MyUser fromJson(Map<String, dynamic> json) {
    return MyUser(
      login: json['login'],
      avatarUrl: json['avatar_url'],
      publicRepos: json['public_repos'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'avatar_url': avatarUrl,
      'public_repos': publicRepos,
    };
  }

  @override
  String toString() {
    return 'MyUser(login: $login, avatarUrl: $avatarUrl, publicRepos: $publicRepos)';
  }

}
