import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl = 'https://api.github.com';

  // search users on github
  Future<List<dynamic>> searchUsersByPage(String query, int page) async {
    final response = await http.get(
      Uri.parse('$baseUrl/search/users?q=$query&page=$page&per_page=10'),
      headers: {
        'Accept': 'application/vnd.github.v3+json',
        // 'Authorization': 'token $apiToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['items'];
    } else {
      throw Exception('Failed to load users');
    }
  }


  // get the amount of user repositories
  Future<int> getUserReposCount(String username) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/$username'),
      headers: {
        'Accept': 'application/vnd.github.v3+json',
        // 'Authorization': 'token $apiToken', // Descomentar si estás utilizando un token
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['public_repos'];
    } else {
      throw Exception('Failed to load user repos');
    }
  }
}
