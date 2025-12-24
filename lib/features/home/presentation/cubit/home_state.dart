import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String? error;

  const HomeState({
    this.isLoading = false,
    this.error,
  });

  HomeState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, error];
}
