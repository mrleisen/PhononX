
import 'package:flutter/material.dart';
import 'package:phononx_test/base/utilities/DependencyInjection.dart';
import 'package:phononx_test/base/utilities/constants/VisualConstants.dart';
import 'package:phononx_test/base/widgets/UserItem.dart';
import 'package:phononx_test/domain/models/user/User.dart';
import 'package:phononx_test/pesentation/home/HomeScreenContract.dart';
import 'package:phononx_test/pesentation/home/HomeScreenPresenter.dart';

class HomeScreenView extends StatefulWidget {

  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> implements HomeScreenContractView {

  bool _isLoading = false;
  bool _showErrorFromApi = false;
  bool _isUserSet = false;
  String _errorFromApi = "";
  String? _errorText;
  User _userResult = User(name: "", avatarUrl: "", publicRepos: 0);
  final myInputController = TextEditingController();
  late  HomeScreenPresenter _presenter;

  _HomeScreenViewState(){
    _presenter = HomeScreenPresenter(serviceLocator());
  }

  @override
  void initState() {
    super.initState();
    _presenter.attachView(this);
  }

  @override
  Widget build(BuildContext context) {

    const _spaceBetweenInputBoxBottom = 10.0;

    return Scaffold(

        appBar: AppBar(
          title: const Text("GitHub+"),
        ),

        body: Container(
            margin: const EdgeInsets.all(VisualConstants.SPACE_BETWEEN_INPUT_BOXES_AND_SCREEN),
            child: Column(
                children: [

                  // this is the search box
                  TextFormField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Search by username',
                          errorText: _errorText
                      ),
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (value){ _validateInput(value); }
                  ),

                  // this is a space
                  const SizedBox(height: _spaceBetweenInputBoxBottom),

                  // this is the user section
                  (_isLoading) // is getting the user info
                  ? const Center(child: CircularProgressIndicator())
                  : (_showErrorFromApi) // is there an error?
                    ? Text(_errorFromApi) // show the error
                    : Visibility(
                        visible: _isUserSet,
                        child: UserItem(user: _userResult)
                  )

                ]
            )
        )

    );
  }

  @override
  showLoading() {
    _isLoading = true;
    setState(() { });
  }

  @override
  hideLoading() {
    _isLoading = false;
    setState(() { });
  }

  @override
  setUser(User user) {
    _userResult = user;
    _showErrorFromApi = false;
    _isUserSet = true;
    setState(() { });
  }

  @override
  showError(String errorMessage) {
    _showErrorFromApi = true;
    _errorFromApi = errorMessage;
    setState(() { });
  }

  // private functions
  _validateInput(String value){
    if(value.isNotEmpty){
      _errorText = null;
      _presenter.getUser(value);
    }else{
      _errorText = "Please enter a username";
      setState(() { });
    }
  }
}
