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
          dishes: [],
          errorMessage: noError,
        )) {
    on<DishesFetched>(_dishesFetched);
  }

  FutureOr<void> _dishesFetched(DishesFetched event, Emitter<BoxState> emit) {
    emit(state.copyWith(boxSatus: BoxSatus.loading));
    final result = boxRepo.getDishes();
    if (result.error == null) {
      emit(
        state.copyWith(
          boxSatus: BoxSatus.success,
          dishes: result.success,
          errorMessage: noError,
        ),
      );
    } else {
      emit(state.copyWith(
        boxSatus: BoxSatus.failure,
        dishes: null,
        errorMessage: result.error.toString(),
      ));
    }
  }
}
