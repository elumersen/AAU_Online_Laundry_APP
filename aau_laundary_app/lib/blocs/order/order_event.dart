import 'package:flutter/material.dart';

import '../../models/cloth.dart';
import '../../models/order.dart';

abstract class OrderEvent {}

class LoadOrderItems extends OrderEvent {}

class SubmitOrder extends OrderEvent {
  Order order;
  SubmitOrder({required this.order});
}

class AddCloth extends OrderEvent {
  Cloth cloth;

  AddCloth({required this.cloth});
}

class RemoveCloth extends OrderEvent {
  Cloth cloth;
  RemoveCloth({required this.cloth});
}

class ResetOrder extends OrderEvent {}
