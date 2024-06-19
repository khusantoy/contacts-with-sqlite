import 'package:flutter/material.dart';

class Contact {
  int id;
  String firstName;
  String lastName;
  int phoneNumber;
  Color color;

  Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.color,
  });

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      phoneNumber: map['phone_number'],
      color: Color(int.parse(map['color'], radix: 16)),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'color': color.value.toRadixString(16), // Convert Color to hex string
    };
  }
}
