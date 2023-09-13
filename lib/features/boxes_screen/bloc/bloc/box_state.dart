part of 'box_bloc.dart';

enum BoxSatus {
  initial,
  loading,
  success,
  failure,
  returned,
}

extension BoxSatusX on BoxSatus {
  bool get isInitial => this == BoxSatus.initial;
  bool get isLoading => this == BoxSatus.loading;
  bool get isSuccess => this == BoxSatus.success;
  bool get isFailure => this == BoxSatus.failure;
  bool get isReturned => this == BoxSatus.returned;
}

class BoxState extends Equatable {
  final BoxSatus boxSatus;
  final DishModel? dish;
  final int? boxNumber;
  final String? errorMessage;

  const BoxState({
    required this.boxSatus,
    this.dish,
    this.boxNumber,
    this.errorMessage,
  });

  BoxState copyWith({
    required boxSatus,
    DishModel? dish,
    int? boxNumber,
    String? errorMessage,
  }) {
    return BoxState(
      boxSatus: boxSatus,
      dish: dish ?? dish,
      boxNumber: boxNumber ?? boxNumber,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [boxSatus, dish, errorMessage];
}
