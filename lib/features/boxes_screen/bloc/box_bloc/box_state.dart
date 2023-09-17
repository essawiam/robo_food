part of 'box_bloc.dart';

enum BoxStatus {
  initial,
  loading,
  success,
  failure,
}

extension BoxSatusX on BoxStatus {
  bool get isInitial => this == BoxStatus.initial;
  bool get isLoading => this == BoxStatus.loading;
  bool get isSuccess => this == BoxStatus.success;
  bool get isFailure => this == BoxStatus.failure;
}

class BoxState extends Equatable {
  final BoxStatus boxSatus;
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
