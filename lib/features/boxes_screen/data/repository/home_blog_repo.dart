import 'package:robo_food/features/boxes_screen/data/data_source/local_data_source.dart';
import 'package:robo_food/features/boxes_screen/data/models/dish_model.dart';

import '../../../../core/error/failure.dart';

/// [BoxeRepo] Is like a single point of truth.
///
/// Controls where to call the data like [Local DB, Remote API].
class BoxRepo {
  final LocalDataSource localDataSource;

  BoxRepo({required this.localDataSource});

  ({Failure? error, DishModel? success}) getDish() {
    return localDataSource.getDish();
  }

  void addReturnedDishe(DishModel dish) {
    localDataSource.addReturnedDish(dish);
  }
}
