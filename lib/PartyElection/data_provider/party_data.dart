import 'dart:convert';

import 'package:main_project/PartyElection/models/party.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class PartyDataProvider {
  final _baseUrl = 'http://192.168.126.57:9090';
  final http.Client httpClient;

  PartyDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Party> createParty(Party party) async {
    final response = await httpClient.post(
      Uri.http('192.168.126.57:9090', '/parties'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'leader': party.partyLeader,
        'name': party.partyName,
        'vote': party.vote,
        'region': party.headQuarter,
        'id': party.id,
        'hpr': party.hpr,
        'description': party.description,
        // 'image': party.image,
      }),
    );

    if (response.statusCode == 200) {
      return Party.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create party!');
    }
  }

  Future<List<Party>> getParties() async {
    final response = await httpClient.get('$_baseUrl/parties');

    if (response.statusCode == 200) {
      final parties = jsonDecode(response.body) as List;
      return parties.map((party) => Party.fromJson(party)).toList();
    } else {
      throw Exception('Failed to load Parties');
    }
  }

  Future<void> deleteParty(int id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/parties/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete party.');
    }
  }

  Future<void> updateParty(Party party) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/parties/${party.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'leader': party.partyLeader,
        'name': party.partyName,
        'vote': party.vote,
        'region': party.headQuarter,
        'id': party.id,
        'hpr': party.hpr,
        'description': party.description,
        // 'image': party.image,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update party.');
    }
  }
}
