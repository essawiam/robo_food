import 'dart:async';

import 'package:flutter/material.dart';
import 'package:robo_food/core/constants/titles.dart';
import 'package:robo_food/features/boxes_screen/data/models/dish_model.dart';

import '../../../../core/utils/timer_formater.dart';

class BoxWidget extends StatefulWidget {
  final DishModel? dishModel;
  final int numberBox;

  const BoxWidget({
    Key? key,
    this.dishModel,
    required this.numberBox,
  }) : super(key: key);

  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  late Timer timer;
  int remainingSeconds = 0;
  bool isDishPickedUp = false;
  @override
  void initState() {
    super.initState();
    startTimer(10);
  }

  void startTimer(int seconds) {
    remainingSeconds = seconds;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          timer.cancel();
          _handleTimerEnd();
        }
      });
    });
  }

  void _handleTimerEnd() {
    setState(() {
      // Here if the isDishPickedUp == false after we finish this.
      // Will retunred it back.
      // and then ask for a new othor orders.
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.dishModel != null && !isDishPickedUp
        ? InkWell(
            onTap: () {
              setState(() {
                isDishPickedUp = true;
              });
            },
            child: Container(
              width: 185,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  width: 10.0,
                  color: Colors.black26,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            widget.dishModel!.imageUrl,
                            height: 60, // Adjust the height as needed
                            width: 60, // Adjust the width as needed
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$boxTitle : ${widget.numberBox.toString()}',
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '$orderId : ${widget.dishModel!.orderId.toString()}',
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later,
                          color: Colors.green,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          formatDuration(Duration(seconds: remainingSeconds)),
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        : Container(
            width: 185,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                width: 10.0,
                color: Colors.black26,
              ),
            ),
            child: const SizedBox());
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }
}
