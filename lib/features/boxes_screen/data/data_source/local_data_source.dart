import 'dart:collection';

import 'package:robo_food/core/extensions/queue_extension.dart';
import 'package:robo_food/features/boxes_screen/data/data_source/fake_data.dart';

import '../models/dish_model.dart';
import '../../../../core/error/failure.dart';

class LocalDataSource {
  late Queue<DishModel> readyDishes;
  LocalDataSource() {
    readyDishes = Queue<DishModel>();
    getReadyDishes();
  }
  void getReadyDishes() {
    readyDishes.addAll(fakeData);
  }

  ({Failure? error, List<DishModel>? success}) getDishes() {
    try {
      if (readyDishes.isNotEmpty) {
        List<DishModel> readyDishItems = readyDishes.getAndRemoveItems();
        return (error: null, success: readyDishItems);
      } else {
        return (error: null, success: []);
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
}
