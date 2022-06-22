
// this class is used to set the api constants
class ApiConstants {

  static const API = "https://api.github.com/";
  static const API_GET_USERS = API + "users/";
  static const API_SEARCH_USERS = API + "search/users?q=";

  // these are local errors
  static const API_GET_USERS_FAILED = "99999";
  static const GET_USERS_FAILED_IN_DATA_SOURCE = "99998";
  static const API_SEARCH_USERS_FAILED = "99997";
  static const SEARCH_USERS_FAILED_IN_DATA_SOURCE = "99996";

}