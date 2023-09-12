import '../../features/boxes_screen/data/models/dish_model.dart';
import '../error/failure.dart';
import 'data_source.dart';

class LocalDataSource extends DataSource {
  @override
  ({Failure? error, List<DishModel>? success}) getDishes() {
    try {
      return (error: null, success: []);
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
