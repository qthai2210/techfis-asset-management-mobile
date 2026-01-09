import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:techfis_asset_management_mobile/features/auth/presentation/models/username.dart';
import 'package:techfis_asset_management_mobile/features/auth/presentation/models/password.dart';

class LoginState extends Equatable {
  const LoginState({
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
  });

  final Username username;
  final Password password;
  final bool isValid;

  LoginState copyWith({
    Username? username,
    Password? password,
    bool? isValid,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [username, password, isValid];
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void usernameChanged(String value) {
    final username = Username.dirty(value);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([username, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.username, password]),
      ),
    );
  }
}
