
import 'package:flutter/material.dart';

import '../../domain/models/my_user.dart';

// this widget draws an avatar, the user name and the amount of repositories
class UserListItemWidget extends StatelessWidget {

  final MyUser user;

  const UserListItemWidget({
    required this.user,
    super.key});

  @override
  Widget build(BuildContext context) {

    // this constants are needed to set the size of various visual elements
    const spaceBetweenUserAvatarAndName = 20.0;
    const sizeOfTheUserAvatar = 60.0;
    const paddingForRepositories = 10.0;
    const spaceUsernameAndRepositories = 5.0;

    return Row(
        children: [

          // this is the user avatar
          SizedBox(
            width: sizeOfTheUserAvatar,
            height: sizeOfTheUserAvatar,
            child: CircleAvatar(
                backgroundImage: NetworkImage(user.avatarUrl)
            ),
          ),

          const SizedBox(width: spaceBetweenUserAvatarAndName),

          // this is the user name and repositories
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // this is the user name
                Text(user.login),

                // this is a space
                const SizedBox(height: spaceUsernameAndRepositories),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: paddingForRepositories),
                  decoration: const ShapeDecoration(
                    color: Colors.blue,
                    shape: StadiumBorder(),
                  ),
                  alignment: Alignment.topLeft,
                  child: Text('${user.publicRepos} repositories',
                      style: const TextStyle(color: Colors.white)
                  ),
                ),

              ]
          )
        ]
    );
  }
}
