import 'package:get_it/get_it.dart';
import 'package:robo_food/features/boxes_screen/data/repository/home_blog_repo.dart';

import 'features/boxes_screen/bloc/box_bloc/box_bloc.dart';
import 'features/boxes_screen/data/data_source/local_data_source.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! boxes_screen
  //BLoC
  sl.registerFactory(
    () => BoxBloc(boxRepo: sl()),
  );
  // repo
  sl.registerLazySingleton(() => BoxRepo(localDataSource: sl()));
  sl.registerLazySingleton(() => LocalDataSource());
}
