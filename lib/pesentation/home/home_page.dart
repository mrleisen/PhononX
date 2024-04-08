import 'package:flutter/material.dart';
import 'package:phononx_test/base/async_response.dart';
import 'package:provider/provider.dart';

import '../widgets/search_users_input_field.dart';
import '../widgets/users_list.dart';
import 'home_viewmodel.dart';

class HomePage extends StatefulWidget {

  static const routName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late HomeViewModel _viewModel;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final spaceBetweenScreenAndContent = 10.0;
  final paddingForInputField = 10.0;
  final spaceBetweenScreenUsers = 10.0;
  final spaceBetweenUsersAndLoadMore = 10.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel = Provider.of<HomeViewModel>(context, listen: false);
      _scrollController.addListener(_onScrollAtTheEndOfTheList);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.removeListener(_onScrollAtTheEndOfTheList);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScrollAtTheEndOfTheList() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _viewModel.loadMoreUsers(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Users'),
        automaticallyImplyLeading: false,
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return Container(
              margin: EdgeInsets.all(spaceBetweenScreenAndContent),
              child: Column(
                  children: [

                    SearchUsersInputField(
                      controller: _controller,
                      paddingForInputField: paddingForInputField,
                      searchUsersByPage: viewModel.searchUsersByPage,
                    ),

                    SizedBox(height: spaceBetweenScreenAndContent),

                    Expanded(
                      child: viewModel.searchUsersResponse is Loading
                          ? const Center(child: CircularProgressIndicator())
                          :  viewModel.searchUsersResponse is Error
                          ? Center(child: Text((viewModel.searchUsersResponse as Error).message))
                          : UsersList(
                        scrollController: _scrollController,
                        spaceBetweenScreenUsers: spaceBetweenScreenUsers,
                        users: viewModel.users,
                      ),
                    ),

                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: spaceBetweenUsersAndLoadMore * 2,
                            bottom: spaceBetweenUsersAndLoadMore
                        ),
                        child: viewModel.loadMoreUsersResponse is Loading
                            ? const CircularProgressIndicator()
                            : viewModel.loadMoreUsersResponse is Error
                            ? Text((viewModel.loadMoreUsersResponse as Error).message)
                            : const SizedBox.shrink()
                      ),
                    ),

                  ]
              )
          );
          },
      ),
    );
  }


}
