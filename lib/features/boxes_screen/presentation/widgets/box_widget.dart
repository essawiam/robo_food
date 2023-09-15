import 'package:flutter/material.dart';
import 'package:robo_food/core/constants/titles.dart';
import 'package:robo_food/features/boxes_screen/data/models/dish_model.dart';

class BoxWidget extends StatelessWidget {
  final DishModel? dishModel;
  final int numberBox;

  const BoxWidget({
    Key? key,
    this.dishModel,
    required this.numberBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dishModel != null
        ? Container(
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
                          dishModel!.imageUrl,
                          height: 60, // Adjust the height as needed
                          width: 60, // Adjust the width as needed
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$boxTitle : ${numberBox.toString()}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '$orderId : ${dishModel!.orderId.toString()}',
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
                  const Row(
                    children: [
                      Icon(
                        Icons.watch_later,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '20:10',
                        style: TextStyle(
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
          )
        : const SizedBox();
  }
}
