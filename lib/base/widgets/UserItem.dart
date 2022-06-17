
import 'package:flutter/material.dart';
import 'package:phononx_test/domain/models/user/User.dart';

class UserItem extends StatelessWidget {

  final User user;

  const UserItem({
    required this.user,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const _spaceBetweenUserNameAndAmountOfRepositories = 4.0;
    const _spaceBetweenUserAvatarAndName = 20.0;

    return Card(
      child: Row(
        children: [

          // this is the user avatar
          SizedBox(
              width: 100,
              height: 100,
              child: Image.network(user.avatarUrl)
          ),

          SizedBox(width: _spaceBetweenUserAvatarAndName),

          // this is the user name and repositories
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // this is the user name
              Text(user.name),

              // this is a space
              const SizedBox(height: 4),

              // this is the amount of repositories
              Container(
                  padding: EdgeInsets.all(_spaceBetweenUserNameAndAmountOfRepositories),
                  child: Text("${user.publicRepos} repositories", style: const TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue
                  )
              )
            ]
          )
        ]
      )
    );
  }
}
