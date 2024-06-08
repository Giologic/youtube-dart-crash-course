import 'dart:core';
import 'dart:math';

abstract class Shipping {
  double getCost(Order order);
  DateTime getDate(Order order);
}

class Item {
  double price;
  int quantity;
  double weight;

  Item(this.price, this.quantity, this.weight);
}

class Order {
  List<Item> lineItems = [];
  Shipping shipping;

  Order(this.lineItems, this.shipping);

  double getTotalPrice() {
    double totalPrice = 0.0;

    for (Item item in lineItems) {
      totalPrice += item.price * item.quantity;
    }

    return totalPrice;
  }

  double getTotalWeight() {
    double totalWeight = 0.0;

    for (Item item in lineItems) {
      totalWeight += item.weight * item.quantity;
    }
    return totalWeight;
  }

  set setShipping(Shipping shipping) {
    this.shipping = shipping;
  }

  double getShippingCost() {
    return shipping.getCost(this);
  }

  getShippingDate() {
    return shipping.getDate(this);
  }
}

class GroundShipping implements Shipping {
  @override
  double getCost(Order order) {
    if (order.getTotalPrice() > 100) {
      return 0.0;
    }

    return max(10, order.getTotalWeight() * 1.5);
  }

  @override
  DateTime getDate(Order order) {
    return DateTime.now().add(Duration(days: 5));
  }
}

class AirShipping implements Shipping {
  @override
  double getCost(Order order) {
    return max(50, order.getTotalWeight() * 3);
  }

  @override
  DateTime getDate(Order order) {
    return DateTime.now().add(Duration(days: 2));
  }
}

void main() {
  var order = Order([Item(10, 2, 10), Item(20, 1, 4)], GroundShipping());
  // print(order.getShippingCost());
  // print(order.getShippingDate());
  print(order.getTotalPrice() + order.getShippingCost());

  order.setShipping = AirShipping();
  print(order.getShippingCost());
  // print(order.getShippingDate());
  // print(order.getTotalPrice());
  print(order.getTotalPrice() + order.getShippingCost());
}
