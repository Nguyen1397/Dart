import 'dart:html';
import 'dart:convert';
import 'Order.dart';

List<Order> orders = [];

void main() {
  querySelector('#orderForm')?.onSubmit.listen(addOrder);
  querySelector('#searchInput')?.onInput.listen(searchOrder);

  // Dữ liệu mẫu ban đầu
  String jsonData = '''
  [
    {"Item": "A1000","ItemName": "Iphone 15","Price": 1200,"Currency": "USD","Quantity":1},
    {"Item": "A1001","ItemName": "Iphone 16","Price": 1500,"Currency": "USD","Quantity":1}
  ]
  ''';
  List<dynamic> list = jsonDecode(jsonData);
  orders = list.map((e) => Order.fromJson(e)).toList();
  renderTable(orders);
}

void renderTable(List<Order> list) {
  final table = querySelector('#orderTable');
  table?.children.clear();

  for (int i = 0; i < list.length; i++) {
    final o = list[i];
    final row = TableRowElement()
      ..innerHtml = '''
      <tr>
        <td class="text-center">${i + 1}</td>
        <td>${o.item}</td>
        <td>${o.itemName}</td>
        <td class="text-center">${o.quantity}</td>
        <td>${o.price.toStringAsFixed(2)}</td>
        <td>${o.currency}</td>
        <td class="text-center">
          <button class="btn btn-sm btn-outline-danger" data-index="$i">🗑</button>
        </td>
      </tr>
      ''';
    table?.append(row);
  }

  // Delete
  table?.querySelectorAll('button').forEach((btn) {
    btn.onClick.listen((_) {
      int index = int.parse(btn.dataset['index']!);
      orders.removeAt(index);
      renderTable(orders);
    });
  });
}

void addOrder(Event e) {
  e.preventDefault();
  final item = (querySelector('#item') as InputElement).value ?? '';
  final itemName = (querySelector('#itemName') as InputElement).value ?? '';
  final price =
      double.tryParse((querySelector('#price') as InputElement).value ?? '0') ??
          0;
  final quantity =
      int.tryParse((querySelector('#quantity') as InputElement).value ?? '0') ??
          0;
  final currency = (querySelector('#currency') as InputElement).value ?? 'USD';

  orders.add(Order(item, itemName, price, currency, quantity));
  renderTable(orders);

  (querySelector('#orderForm') as FormElement).reset();
  (querySelector('#currency') as InputElement).value = 'USD';
}

void searchOrder(Event e) {
  final keyword =
      (querySelector('#searchInput') as InputElement).value?.toLowerCase() ??
          '';
  final filtered =
      orders.where((o) => o.itemName.toLowerCase().contains(keyword)).toList();
  renderTable(filtered);
}
