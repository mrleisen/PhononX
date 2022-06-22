
class SearchUsersRequest {

  // if he request will need more parameters, then those parameters should be added here
  final String query;
  final String IN_LOGIN = "+in:login";

  SearchUsersRequest({
    required this.query
  });

}