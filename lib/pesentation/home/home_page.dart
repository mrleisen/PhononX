import 'package:flutter/material.dart';
import 'package:phononx_test/pesentation/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../base/async_response.dart';
import '../widgets/user_list_item.dart';

class HomePage extends StatefulWidget {

  static const routName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    const spaceBetweenScreenAndContent = 10.0;
    const paddingForInputField = 10.0;
    const spaceBetweenScreenUsers = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Users'),
      ),
      body: Container(
          margin: const EdgeInsets.all(spaceBetweenScreenAndContent),
          child: Column(
              children: [

                // this is the search box
                TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                      hintText: 'Search users',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(paddingForInputField),
                  ),
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) {
                    viewModel.searchUsersByPage(_controller.text);
                  },
                ),

                // this is a space
                const SizedBox(height: spaceBetweenScreenAndContent),

                // this is the user section
                Consumer<HomeViewModel>(
                  builder: (context, userProvider, child) {
                    return userProvider.searchUsersResponse is Loading
                        ? const CircularProgressIndicator()
                        : userProvider.users.isEmpty
                        ? const Text('No users found.')
                        : Expanded(child: ListView.separated(
                      itemCount: userProvider.users.length,
                      separatorBuilder: (context, index) => const SizedBox(height: spaceBetweenScreenUsers),
                      itemBuilder: (context, index) {
                        final user = userProvider.users[index];
                        return UserListItemWidget(user: user);
                      },
                    ),
                    );
                  },
                ),
              ]
          )
      )
    );
  }
}
