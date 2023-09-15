import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/titles.dart';
import '../../bloc/bloc/box_bloc.dart';
import '../widgets/box_widget.dart';

class BoxesPage extends StatefulWidget {
  const BoxesPage({Key? key}) : super(key: key);

  @override
  State<BoxesPage> createState() => _BoxesPageState();
}

class _BoxesPageState extends State<BoxesPage> {
  @override
  void initState() {
    super.initState();
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
                          const SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: BoxWidget(
                              numberBox: index + 1,
                              dishModel: state.dishes![index],
                            ),
                          ),
                          index == 2
                              ? const SizedBox(
                                  width: 70,
                                )
                              : const SizedBox(
                                  width: 2,
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
                          const SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: BoxWidget(
                              numberBox: index + 7,
                              dishModel: state.dishes![index + 6],
                            ),
                          ),
                          index == 2
                              ? const SizedBox(
                                  width: 70,
                                )
                              : const SizedBox(
                                  width: 2,
                                )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
