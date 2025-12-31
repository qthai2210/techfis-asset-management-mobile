import '../entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.fullName,
    required super.email,
    required super.employeeCode,
    super.avatarUrl,
    super.departmentId,
    super.position,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      employeeCode: json['employee_code'] ?? '',
      avatarUrl: json['avatar_url'],
      departmentId: json['department_id']?.toString(),
      position: json['position'],
      role: json['account']?['role'] ?? 'USER',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'employee_code': employeeCode,
      'avatar_url': avatarUrl,
      'department_id': departmentId,
      'position': position,
      'account': {'role': role},
    };
  }
}
