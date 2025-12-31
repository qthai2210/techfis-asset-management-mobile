import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String fullName;
  final String email;
  final String employeeCode;
  final String? avatarUrl;
  final String? departmentId;
  final String? position;
  final String role; // From Account.role

  const User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.employeeCode,
    this.avatarUrl,
    this.departmentId,
    this.position,
    required this.role,
  });

  @override
  List<Object?> get props => [id, fullName, email, employeeCode, avatarUrl, departmentId, position, role];
}
