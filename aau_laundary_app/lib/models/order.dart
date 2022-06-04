class Order {
  String orderId;
  String userId;
  List clothes;
  double price;
  
  Order({required this.orderId,required this.userId,required this.clothes,required this.price});

  factory Order.fromJson(orderJson){
    return Order(orderId: orderJson["_id"],clothes: orderJson['clothes'],userId: orderJson['userId'],price: orderJson['price']);
  }

}