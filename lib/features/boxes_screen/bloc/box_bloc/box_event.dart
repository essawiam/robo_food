part of 'box_bloc.dart';

@immutable
abstract class BoxEvent {}

class DishesFetched extends BoxEvent {}

class BoxesReset extends BoxEvent {}
