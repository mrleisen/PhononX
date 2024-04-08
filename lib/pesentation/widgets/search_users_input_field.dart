

import 'package:flutter/material.dart';

class SearchUsersInputField extends StatelessWidget {

  final TextEditingController _controller;
  final double paddingForInputField;
  final Function(String) searchUsersByPage;

  const SearchUsersInputField({
    super.key,
    required TextEditingController controller,
    required this.paddingForInputField,
    required this.searchUsersByPage,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: _controller,
    decoration: InputDecoration(
      hintText: 'Search users',
      suffixIcon: const Icon(Icons.search),
      border: const OutlineInputBorder(),
      contentPadding: EdgeInsets.all(paddingForInputField),
    ),
    textInputAction: TextInputAction.search,
    onFieldSubmitted: (value) {
      searchUsersByPage(_controller.text);
    },
  );
}