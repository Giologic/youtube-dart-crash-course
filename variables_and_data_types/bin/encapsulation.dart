/*
Pseudocode:
method getOrderTotal(order) is
 ​​  total = 0
 ​​  foreach item in order.lineItems
 ​​    total += item.price * item.quantity
 ​​  if (order.country == "US")
 ​​    total += total * 0.07 // US sales tax
 ​​  else if (order.country == "EU"):
 ​​    total += total * 0.20 // European VAT
 ​​  return total
*/

double getOrderTotal(dynamic order) {
  double total = 0;

  // Iterate through order line items
  for (var item in order.lineItems) {
    total += item.price * item.quantity;
  }

  // Apply sales tax or VAT based on country
  if (order.country == "US") {
    total += total * 0.07; // US sales tax
  } else if (order.country == "EU") {
    total += total * 0.20; // European VAT
  }

  return total;
}

// Extract the tax calculation logic into a separate method, hiding it from the orginal method.
double getOrderTotalWithEncapsulation(dynamic order) {
  double total = 0;

  // Iterate through order line items
  for (var item in order.lineItems) {
    total += item.price * item.quantity;
  }

  // Apply sales tax or VAT based on country
  total += _calculateTax(total, order.country);

  return total;
}

double _calculateTax(double total, String country) {
  if (country == "US") {
    return total * 0.07; // US sales tax
  } else if (country == "EU") {
    return total * 0.20; // European VAT
  }
  return 0;
}
