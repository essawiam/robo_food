import 'package:robo_food/features/boxes_screen/data/models/dish_model.dart';

import '../error/failure.dart';

/// [DataSource] Is intended to be used as a base class for various data source implementations

abstract class DataSource {
  ({Failure? error, List<DishModel>? success}) getDishes();
}
