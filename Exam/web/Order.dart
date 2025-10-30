class Order {
  String item;
  String itemName;
  double price;
  String currency;
  int quantity;

  Order(this.item, this.itemName, this.price, this.currency, this.quantity);

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      json['Item'],
      json['ItemName'],
      (json['Price']).toDouble(),
      json['Currency'],
      json['Quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
    'Item': item,
    'ItemName': itemName,
    'Price': price,
    'Currency': currency,
    'Quantity': quantity,
  };
}
