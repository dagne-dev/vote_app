import 'dart:convert';

import 'package:main_project/ElectionInfo/election_info.dart';
import 'package:main_project/PartyElection/models/party.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class ElectionDataProvider {
  final _baseUrl = 'http://192.168.126.57:9090';
  final http.Client httpClient;

  ElectionDataProvider({@required this.httpClient})
      : assert(httpClient != null);

  Future<Election> createElection(Election election) async {
    final response = await httpClient.post(
      Uri.http('192.168.126.57:9090', '/elections'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': election.id,
        'leader': election.boardLeader,
        'country': election.country,
        'description': election.description,
        'year': election.electionYear,
        // 'image': party.image,
      }),
    );

    if (response.statusCode == 200) {
      return Election.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create election!');
    }
  }

  Future<List<Election>> getElections() async {
    final response = await httpClient.get('$_baseUrl/elections');

    if (response.statusCode == 200) {
      final elections = jsonDecode(response.body) as List;
      return elections.map((election) => Election.fromJson(election)).toList();
    } else {
      throw Exception('Failed to load Elections');
    }
  }

  Future<void> deleteElection(int id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/elections/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete election.');
    }
  }

  Future<void> updateElection(Election election) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/elections/${election.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': election.id,
        'leader': election.boardLeader,
        'country': election.country,
        'description': election.description,
        'year': election.electionYear,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update Election.');
    }
  }
}
