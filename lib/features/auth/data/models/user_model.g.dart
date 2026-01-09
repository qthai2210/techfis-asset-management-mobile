// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      employeeCode: json['employee_code'] as String,
      avatarUrl: json['avatar_url'] as String?,
      departmentId: json['department_id'] as String?,
      position: json['position'] as String?,
      role: json['role'] as String,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'employee_code': instance.employeeCode,
      'avatar_url': instance.avatarUrl,
      'department_id': instance.departmentId,
      'position': instance.position,
      'role': instance.role,
    };
