// To parse this JSON data, do
//
//     final authSuccessResponse = authSuccessResponseFromMap(jsonString);

import 'dart:convert';

AuthSuccessResponse authSuccessResponseFromMap(String str) =>
    AuthSuccessResponse.fromMap(json.decode(str));

String authSuccessResponseToMap(AuthSuccessResponse data) =>
    json.encode(data.toMap());

class AuthSuccessResponse {
  AuthSuccessResponse({
    required this.message,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.contactNumber,
    required this.alternateContactNumber,
    required this.id,
    required this.access,
    required this.role,
    required this.organizationId,
  });

  final String message;
  final String email;
  final String firstName;
  final String lastName;
  final String contactNumber;
  final String alternateContactNumber;
  final String id;
  final String access;
  final String role;
  final String organizationId;

  factory AuthSuccessResponse.fromMap(Map<String, dynamic> json) =>
      AuthSuccessResponse(
        message: json["message"] == null ? null : json["message"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        contactNumber:
            json["contact_number"] == null ? null : json["contact_number"],
        alternateContactNumber: json["alternate_contact_number"] == null
            ? null
            : json["alternate_contact_number"],
        id: json["id"] == null ? null : json["id"],
        access: json["access"] == null ? null : json["access"],
        role: json["role"] == null ? null : json["role"],
        organizationId:
            json["organization_id"] == null ? null : json["organization_id"],
      );

  Map<String, dynamic> toMap() => {
        "message": message == null ? null : message,
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "contact_number": contactNumber == null ? null : contactNumber,
        "alternate_contact_number":
            alternateContactNumber == null ? null : alternateContactNumber,
        "id": id == null ? null : id,
        "access": access == null ? null : access,
        "role": role == null ? null : role,
        "organization_id": organizationId == null ? null : organizationId,
      };
}
