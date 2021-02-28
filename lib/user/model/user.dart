import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable {
  User(
      {this.id,
      @required this.fullName,
      @required this.image,
      @required this.email,
      @required this.age,
      @required this.password,
      @required this.region});

  final String id;
  final String fullName;
  final String email;
  final String image;
  final String region;
  final String password;
  final int age;

  @override
  List<Object> get props => [id, fullName, image, email, region, age, password];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['fullName'],
      image: json['image'],
      age: json['age'],
      password: json['password'],
      email: json['email'],
      region: json['region'],
    );
  }

  @override
  String toString() => 'Course { id: $id, code: $image, ects: $age }';
}
