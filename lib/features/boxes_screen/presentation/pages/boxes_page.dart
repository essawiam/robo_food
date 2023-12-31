import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:robo_food/core/constants/errors.dart';

import '../../../../core/constants/titles.dart';
import '../../bloc/box_bloc/box_bloc.dart';
import '../widgets/box_widget.dart';

class BoxesPage extends StatefulWidget {
  const BoxesPage({Key? key}) : super(key: key);

  @override
  State<BoxesPage> createState() => _BoxesPageState();
}

class _BoxesPageState extends State<BoxesPage> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    // Call for a new data each 25 seconds.
    timer = Timer.periodic(
      const Duration(seconds: 25),
      (Timer t) => context.read<BoxBloc>().add(DishesFetched()),
    );

    context.read<BoxBloc>().add(DishesFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          roboName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<BoxBloc, BoxState>(
        builder: (context, state) {
          if (state.boxSatus.isSuccess) {
            return Container(
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 1.w,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: BoxWidget(
                                numberBox: index + 1,
                                dishModel: index + 1 <= state.dishes!.length
                                    ? state.dishes![index]
                                    : null,
                              ),
                            ),
                            index == 2
                                ? SizedBox(
                                    width: 17.w,
                                  )
                                : SizedBox(
                                    width: 2.w,
                                  )
                          ],
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 1.w,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: BoxWidget(
                                numberBox: index + 7,
                                dishModel: (index + 7) <= state.dishes!.length
                                    ? state.dishes![index + 6]
                                    : null,
                              ),
                            ),
                            index == 2
                                ? SizedBox(
                                    width: 17.w,
                                  )
                                : SizedBox(
                                    width: 2.w,
                                  )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          if (state.boxSatus.isFailure) {
            return const Center(child: Text(anError));
          }
          return Container();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }
}
