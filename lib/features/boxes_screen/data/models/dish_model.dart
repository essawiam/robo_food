class DishModel {
  final int orderId;
  final String dishName;
  final String imageUrl;

  DishModel({
    required this.orderId,
    required this.dishName,
    required this.imageUrl,
  });
  @override
  String toString() {
    return 'orderId:$orderId, dishName: $dishName, imageUrl: $imageUrl';
  }
}
