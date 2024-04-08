

import 'package:flutter/material.dart';

import '../../domain/models/my_user.dart';
import 'user_list_item.dart';

class UsersList extends StatelessWidget {

  final double spaceBetweenScreenUsers;
  final List<MyUser> users;
  final ScrollController scrollController;

  const UsersList({
    super.key,
    required this.spaceBetweenScreenUsers,
    required this.users,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context)
  => ListView.separated(
    controller: scrollController,
    itemCount: users.length,
    separatorBuilder: (context, index) => SizedBox(height: spaceBetweenScreenUsers),
    itemBuilder: (context, index) {
      final user = users[index];
      return UserListItemWidget(user: user);
    },
  );

}