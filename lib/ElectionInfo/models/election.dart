import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Election extends Equatable {
  Election({
    this.id,
    @required this.boardLeader,
    @required this.electionYear,
    @required this.country,
    @required this.description,
  });

  final int id;
  final String boardLeader;
  final String electionYear;
  final String description;
  final String country;

  @override
  List<Object> get props =>
      [id, boardLeader, description, country, electionYear];

  factory Election.fromJson(Map<String, dynamic> json) {
    return Election(  
      id: json['id'],
      boardLeader: json['leader'],
      electionYear: json['year'],
      country: json['country'],
      description: json['description'],
    );
  }

  @override
  String toString() =>
      'Election { name: $boardLeader, description: $description , country:$country, year:$electionYear}';
}
