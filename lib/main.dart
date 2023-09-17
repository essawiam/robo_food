import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:robo_food/features/boxes_screen/presentation/pages/boxes_page.dart';
import 'core/constants/titles.dart';
import 'core/observers/app_bloc_observer.dart';
import 'features/boxes_screen/bloc/box_bloc/box_bloc.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = AppBlocOberver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: roboName,
        home: BlocProvider(
          create: (context) => sl<BoxBloc>(),
          child: const BoxesPage(),
        ),
      ),
    );
  }
}
