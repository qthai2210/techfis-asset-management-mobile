import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'theme_bloc.freezed.dart';
part 'theme_bloc.g.dart';

// Events
@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.started() = ThemeLoadRequested;
  const factory ThemeEvent.changed(ThemeMode themeMode) = ThemeChanged;
}

// State
@freezed
abstract class ThemeState with _$ThemeState {
  const ThemeState._();

  const factory ThemeState(int themeModeIndex) = _ThemeState;

  ThemeMode get themeMode {
    if (themeModeIndex < 0 || themeModeIndex >= ThemeMode.values.length) {
      return ThemeMode.system;
    }
    return ThemeMode.values[themeModeIndex];
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);
}

// Bloc
@injectable
class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeMode.system.index)) {
    on<ThemeLoadRequested>((event, emit) {}); // HydratedBloc handles init
    on<ThemeChanged>((event, emit) {
      emit(ThemeState(event.themeMode.index));
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) => ThemeState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ThemeState state) => state.toJson();
}
