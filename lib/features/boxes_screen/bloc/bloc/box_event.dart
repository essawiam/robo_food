part of 'box_bloc.dart';

@immutable
abstract class BoxEvent {}

class DishFetched extends BoxEvent {
  final int boxNumber;
  DishFetched({required this.boxNumber});
}

class DishReturned extends BoxEvent {
  final DishModel dish;
  final int boxNumber;
  DishReturned({
    required this.dish,
    required this.boxNumber,
  });
}
