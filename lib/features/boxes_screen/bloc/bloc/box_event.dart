part of 'box_bloc.dart';

@immutable
abstract class BoxEvent {}

class DishesFetched extends BoxEvent {}

class DishReturned extends BoxEvent {
  final DishModel dish;
  final int boxNumber;
  DishReturned({
    required this.dish,
    required this.boxNumber,
  });
}
