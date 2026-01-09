// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techfis_asset_management_mobile/features/auth/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel implements User {
  const UserModel._();

  const factory UserModel({
    required String id,
    @JsonKey(name: 'full_name') required String fullName,
    required String email,
    @JsonKey(name: 'employee_code') required String employeeCode,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'department_id') String? departmentId,
    String? position,
    required String role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(_preprocessJson(json));

  static Map<String, dynamic> _preprocessJson(Map<String, dynamic> json) {
    final Map<String, dynamic> data = Map.from(json);

    // Handle role fallback
    if (data['role'] == null && data['account'] != null) {
      data['role'] = data['account']['role'];
    }
    data['role'] ??= 'USER';

    // Ensure ID is String
    if (data['id'] != null) {
      data['id'] = data['id'].toString();
    }

    // Ensure departmentId is String
    if (data['department_id'] != null) {
      data['department_id'] = data['department_id'].toString();
    }

    return data;
  }

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        employeeCode,
        avatarUrl,
        departmentId,
        position,
        role,
      ];

  @override
  bool? get stringify => true;
}
