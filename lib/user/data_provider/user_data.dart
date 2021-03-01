import 'dart:convert';

// import 'package:main_project/PartyElection/models/party.dart';
import 'package:main_project/user/model/user.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  final _baseUrl = 'http://192.168.56.1:3000';
  final http.Client httpClient;

  UserDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<User> createUser(User user) async {
    final response = await httpClient.post(
      Uri.http('192.168.56.1:3000', '/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': user.name,
        'age': user.age,
        'region': user.region,
        'email': user.email,
        'password': user.password,
        'id': user.id,
      }),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create users!');
    }
  }

  Future<List<User>> getUsers() async {
    final response = await httpClient.get('$_baseUrl/users');

    if (response.statusCode == 200) {
      final users = jsonDecode(response.body) as List;
      return users.map((party) => User.fromJson(party)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<void> deleteUser(String id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/users/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete user.');
    }
  }

  Future<void> updateUser(User user) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/parties/${user.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': user.name,
        'age': user.age,
        'region': user.region,
        'email': user.email,
        'password': user.password,
        'id': user.id,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user.');
    }
  }
}
