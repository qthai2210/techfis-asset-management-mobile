import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_dashboard_data_usecase.dart';

// EVENTS
abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboardLoadRequested extends DashboardEvent {}

class DashboardRefreshRequested extends DashboardEvent {}

// STATE
abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final DashboardData data;

  const DashboardLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class DashboardError extends DashboardState {
  final String message;

  const DashboardError(this.message);

  @override
  List<Object> get props => [message];
}

// BLOC
@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardDataUseCase getDashboardData;

  DashboardBloc(this.getDashboardData) : super(DashboardInitial()) {
    on<DashboardLoadRequested>(_onLoadRequested);
    on<DashboardRefreshRequested>(_onRefreshRequested);
  }

  Future<void> _onLoadRequested(
    DashboardLoadRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading());
    final result = await getDashboardData(NoParams());
    result.fold(
      (failure) => emit(const DashboardError('Failed to load dashboard data')),
      (data) => emit(DashboardLoaded(data)),
    );
  }

  Future<void> _onRefreshRequested(
    DashboardRefreshRequested event,
    Emitter<DashboardState> emit,
  ) async {
    // Keep showing current state if we want, or show loading indicator in UI via RefreshIndicator
    // For now, simple reload
    // emit(DashboardLoading()); // Optional: don't clear UI on refresh
    final result = await getDashboardData(NoParams());
    result.fold(
      (failure) => emit(const DashboardError('Failed to refresh data')),
      (data) => emit(DashboardLoaded(data)),
    );
  }
}
