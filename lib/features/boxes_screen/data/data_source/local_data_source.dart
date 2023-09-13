import 'dart:collection';

import 'package:robo_food/features/boxes_screen/data/data_source/fake_data.dart';

import '../models/dish_model.dart';
import '../../../../core/error/failure.dart';

class LocalDataSource {
  late Queue<DishModel> readyDishes;
  late Queue<DishModel> returnedDishes;

  LocalDataSource() {
    readyDishes = Queue<DishModel>();
    returnedDishes = Queue<DishModel>();
    getReadyDishes();
  }
  void getReadyDishes() {
    readyDishes.addAll(fakeData);
  }

  ({Failure? error, DishModel? success}) getDish() {
    try {
      if (readyDishes.isNotEmpty) {
        return (error: null, success: readyDishes.removeFirst());
      } else if (returnedDishes.isNotEmpty) {
        return (error: null, success: returnedDishes.removeFirst());
      } else {
        return (error: null, success: null);
      }
    } catch (e) {
      return (
        error: Failure(
          errorMessage: e.toString(),
        ),
        success: null
      );
    }
  }

  void addReturnedDish(DishModel dish) {
    returnedDishes.add(dish);
  }
}
