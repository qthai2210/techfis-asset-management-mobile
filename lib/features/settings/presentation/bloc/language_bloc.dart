import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:techfis_asset_management_mobile/features/settings/domain/repositories/language_repository.dart';

// Events
abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class LanguageLoadRequested extends LanguageEvent {}

class LanguageChanged extends LanguageEvent {
  final String languageCode;

  const LanguageChanged(this.languageCode);

  @override
  List<Object> get props => [languageCode];
}

// State
class LanguageState extends Equatable {
  final Locale locale;

  const LanguageState(this.locale);

  @override
  List<Object> get props => [locale];
}

// Bloc
@injectable
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LanguageRepository _repository;

  LanguageBloc(this._repository) : super(const LanguageState(Locale('vi'))) {
    on<LanguageLoadRequested>(_onLoadRequested);
    on<LanguageChanged>(_onChanged);
  }

  Future<void> _onLoadRequested(
    LanguageLoadRequested event,
    Emitter<LanguageState> emit,
  ) async {
    final languageCode = await _repository.getLanguage();
    emit(LanguageState(Locale(languageCode)));
  }

  Future<void> _onChanged(
    LanguageChanged event,
    Emitter<LanguageState> emit,
  ) async {
    await _repository.setLanguage(event.languageCode);
    emit(LanguageState(Locale(event.languageCode)));
  }
}
