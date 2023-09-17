import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  bool isRedIcon = false;

  @override
  void initState() {
    super.initState();
    startTimer(20);
  }

  @override
  void didUpdateWidget(covariant BoxWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.numberBox == oldWidget.numberBox) {
      startTimer(20);
      isDishPickedUp = false;
    }
  }

  void startTimer(int seconds) {
    remainingSeconds = seconds;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
          // Check if the remaining time is 10 seconds or less
          isRedIcon = remainingSeconds <= 10;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.dishModel != null && !isDishPickedUp
        ? InkWell(
            onTap: () {
              // It means the customer pick it up.
              setState(() {
                isDishPickedUp = true;
              });
            },
            child: Container(
              width: 52.w,
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  width: 3.w,
                  color: Colors.black26,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Animate(
                  effects: const [FadeEffect(), SlideEffect()],
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
                              height: 48.h,
                              width: 15.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$boxTitle : ${widget.numberBox.toString()}',
                                style: TextStyle(
                                  fontSize: 4.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '$orderId : ${widget.dishModel!.orderId.toString()}',
                                style: TextStyle(
                                  fontSize: 4.0.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later,
                            color: isRedIcon ? Colors.red : Colors.green,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            formatDuration(Duration(seconds: remainingSeconds)),
                            style: TextStyle(
                              fontSize: 5.0.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : Container(
            width: 52.w,
            height: 150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                width: 3.w,
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
