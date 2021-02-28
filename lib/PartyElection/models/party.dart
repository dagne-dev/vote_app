import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Party extends Equatable {
  Party(
      {this.id,
      @required this.partyName,
      @required this.vote,
      @required this.partyLeader,
      @required this.description,
      @required this.headQuarter,
      @required this.hpr});

  final int id;
  final int vote;
  final String partyLeader;
  final String partyName;
  final String description;
  final String headQuarter;
  final int hpr;

  @override
  List<Object> get props =>
      [id, partyName, description, hpr, headQuarter, partyLeader, vote];

  factory Party.fromJson(Map<String, dynamic> json) {
    return Party(
      id: json['id'],
      vote: json['vote'],
      partyName: json['name'],
      partyLeader: json['leader'],
      description: json['description'],
      hpr: json['hpr'],
      headQuarter: json['region'],
    );
  }

  @override
  String toString() =>
      'Party { name: $partyName, description: $description , vote:$vote, leader:$partyLeader,hpr:$hpr,region:$headQuarter}';
}
