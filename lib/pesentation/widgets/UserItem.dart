
import 'package:flutter/material.dart';
import 'package:phononx_test/domain/models/user/User.dart';

// this widget draws an avatar, the user name and the amount of repositories
class UserListItemWidget extends StatelessWidget {

  final User user;

  const UserListItemWidget({
    required this.user,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // this constants are needed to set the size of various visual elements
    const _spaceBetweenUserNameAndAmountOfRepositories = 4.0;
    const _spaceBetweenUserAvatarAndName = 20.0;
    const _sizeOfTheUserAvatar = 100.0;
    const _sizeOfRoundedCorners = 10.0;

    return Card(
      child: Row(
        children: [

          // this is the user avatar
          SizedBox(
              width: _sizeOfTheUserAvatar,
              height: _sizeOfTheUserAvatar,
              child: Image.network(user.avatarUrl)
          ),

          const SizedBox(width: _spaceBetweenUserAvatarAndName),

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
                  padding: const EdgeInsets.all(_spaceBetweenUserNameAndAmountOfRepositories),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_sizeOfRoundedCorners),
                      color: Colors.blue
                  ),
                  child: Text("${user.publicRepos} repositories", style: const TextStyle(color: Colors.white))
              )
            ]
          )
        ]
      )
    );
  }
}
