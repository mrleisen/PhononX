
import 'package:flutter/material.dart';

import '../../domain/models/my_user.dart';

// this widget draws an avatar, the user name and the amount of repositories
class UserListItemWidget extends StatelessWidget {

  final MyUser user;

  const UserListItemWidget({
    required this.user,
    super.key});

  // this constants are needed to set the size of various visual elements
  final spaceBetweenUserAvatarAndName = 20.0;
  final sizeOfTheUserAvatar = 100.0;
  final paddingForRepositories = 10.0;
  final spaceUsernameAndRepositories = 5.0;

  @override
  Widget build(BuildContext context) {

    return Row(
        children: [
          _buildUserAvatar(),
          SizedBox(width: spaceBetweenUserAvatarAndName),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserName(),
                SizedBox(height: spaceUsernameAndRepositories),
                _buildUserRepositories(),
              ]
          )
        ]
    );
  }

  Widget _buildUserAvatar()
  => SizedBox(
    width: sizeOfTheUserAvatar,
    height: sizeOfTheUserAvatar,
    child: CircleAvatar(
        backgroundImage: NetworkImage(user.avatarUrl)
    ),
  );

  Widget _buildUserName() => Text(user.login);

  Widget _buildUserRepositories()
  => Container(
    padding: EdgeInsets.symmetric(horizontal: paddingForRepositories),
    decoration: const ShapeDecoration(
      color: Colors.blue,
      shape: StadiumBorder(),
    ),
    alignment: Alignment.topLeft,
    child: Text('${user.publicRepos} repositories',
        style: const TextStyle(color: Colors.white)
    ),
  );

}
