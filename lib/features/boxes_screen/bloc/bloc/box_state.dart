part of 'box_bloc.dart';

enum BoxSatus {
  initial,
  loading,
  success,
  failure,
}

extension BoxSatusX on BoxSatus {
  bool get isInitial => this == BoxSatus.initial;
  bool get isLoading => this == BoxSatus.loading;
  bool get isSuccess => this == BoxSatus.success;
  bool get isFailure => this == BoxSatus.failure;
}

class BoxState extends Equatable {
  final BoxSatus boxSatus;
  final List<DishModel>? dishes;
  final String? errorMessage;

  const BoxState({
    required this.boxSatus,
    this.dishes,
    this.errorMessage,
  });

  BoxState copyWith({
    required boxSatus,
    List<DishModel>? dishes,
    int? boxNumber,
    String? errorMessage,
  }) {
    return BoxState(
      boxSatus: boxSatus,
      dishes: dishes ?? dishes,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        boxSatus,
        dishes,
        errorMessage,
      ];
}
