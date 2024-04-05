import 'dart:convert';
import 'package:fundflow/models/registerModel.dart';
import 'package:http/http.dart' as http;

class RegisterApiHandler {
  final String baseUri = "http://localhost:5269/api/users/";

   Future registerUser(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse(baseUri + "register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'email': email,
        'passwordHash': password,
      }),
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return 'Registration successful';
    } else {
      throw Exception('Failed register user: ${response.body}');
    }
   }

 Future<User> login({String? username, String? email, required String password}) async {
  if (username == null && email == null) {
      throw ArgumentError('Either username or email must be provided.');
    }

    final uri = Uri.parse(baseUri + "login");

    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          if (username != null) 'username': username,
          if (email != null) 'email': email,
          'passwordHash': password,
        }),
      );

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        // Parse the response body as JSON
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        // Validate response structure
        if (responseBody.containsKey('id') && responseBody.containsKey('username')) {
          // Return a User object
          return User.fromJson(responseBody);
        } else {
          throw Exception('Invalid response format.');
        }
      } else {
        throw Exception('Failed to login user: ${response.body}');
      }
    } catch (e) {
      // Handle network errors or other exceptions
      throw Exception('Failed to login user: $e');
    }
  }

}