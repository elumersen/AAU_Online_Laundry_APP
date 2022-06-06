// import 'dart:ffi';

class Order {
  String orderId;
  String userId;
  List clothes;
  double price;

  Order(
      {required this.orderId,
      required this.userId,
      required this.clothes,
      required this.price});

  factory Order.fromJson(orderJson) {
    return Order(
        orderId: orderJson["_id"],
        clothes: orderJson['clothes'],
        userId: orderJson['userId'],
        price: orderJson['price']);
  }
  Map<String, Object> toMap() {
    return {
      "orderId": this.orderId,
      "userId": this.userId,
      "clothes": this.clothes,
      "price": this.price,
      // "status": this.status
    };
  }
}
