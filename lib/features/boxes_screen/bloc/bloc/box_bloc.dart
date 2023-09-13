import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:robo_food/core/constants/errors.dart';
import 'package:robo_food/features/boxes_screen/data/models/dish_model.dart';
import 'package:robo_food/features/boxes_screen/data/repository/home_blog_repo.dart';

part 'box_event.dart';
part 'box_state.dart';

class BoxBloc extends Bloc<BoxEvent, BoxState> {
  final BoxRepo boxRepo;
  BoxBloc({required this.boxRepo})
      : super(const BoxState(
          boxSatus: BoxSatus.initial,
          dish: null,
          errorMessage: noError,
        )) {
    on<DishFetched>(_dishFetched);
    on<DishReturned>(_dishReturned);
  }
  FutureOr<void> _dishFetched(DishFetched event, Emitter<BoxState> emit) {
    emit(state.copyWith(boxSatus: BoxSatus.loading));
    final result = boxRepo.getDish();
    if (result.error == null) {
      emit(
        state.copyWith(
          boxSatus: BoxSatus.success,
          dish: result.success,
          boxNumber: event.boxNumber,
        ),
      );
    } else {
      emit(state.copyWith(
        boxSatus: BoxSatus.failure,
        boxNumber: event.boxNumber,
        errorMessage: result.error.toString(),
      ));
    }
  }

  FutureOr<void> _dishReturned(DishReturned event, Emitter<BoxState> emit) {
    emit(state.copyWith(boxSatus: BoxSatus.loading));
    boxRepo.addReturnedDishe(event.dish);
    emit(state.copyWith(
      boxSatus: BoxSatus.returned,
      boxNumber: event.boxNumber,
      errorMessage: returnedDish,
    ));
  }
}
