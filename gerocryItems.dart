import 'dart:io';

void main() {
  // first we should intializ a list of maps that contain items
  List<Map<String, dynamic>> gerocryItems = [
    {"name": "eggs", "price": 7.25},
    {"name": "milk", "price": 45},
    {"name": "cheese", "price": 62},
    {"name": "coffe", "price": 275},
    {"name": "rice", "price": 56}
  ];

  // then we should intializ the tax rate and we should use const
  const double taxRate = 0.14;

  //i want to show the list then make the user choose items
  List<Map<String, dynamic>> userShoppingList = [];

  print('available items:');
  for (int i = 0; i < gerocryItems.length; i++) {
    print('${i + 1}. ${gerocryItems[i]['name']} - ${gerocryItems[i]['price']}');
  }
  ;

  //make the user choose items
  while (true) {
    print(
        '\nEnter the number of the item you want to add to your list (or 0 to finish):');
    String? input = stdin.readLineSync();
    if (input == null || input.isEmpty || int.tryParse(input) == null) {
      print('Invalid input. Please try again.');
      continue;
    }
    ;

    int choise = int.tryParse(input) ?? -1;
    if (choise == 0) {
      break;
    } else if (choise > 0 && choise <= gerocryItems.length) {
      userShoppingList.add(gerocryItems[choise - 1]);
      print('${gerocryItems[choise - 1]['name']} added to your list.');
    } else if (choise > gerocryItems.length) {
      print('Invalid input. Please try again.');
      continue;
    }
  }
  ;
  //show the user the final shopping list
  if (userShoppingList.isEmpty) {
    print('Your shopping list is empty.');
  } else {
    print('\nYour final shopping list:');
    for (int i = 0; i < userShoppingList.length; i++) {
      print(
          '${i + 1}. ${userShoppingList[i]['name']} - ${userShoppingList[i]['price']}');
    }
    ;
  }

  //now we should calculate total price of the items

  double totalPrice = 0.0;
  for (var item in userShoppingList) {
    totalPrice += item['price'];
  }
  //now we should calculate total price of the items with tax

  double totalWithTax = totalPrice + (totalPrice * taxRate);

  // Print total cost & total cost with tax
  print('\nTotal Price: \$${totalPrice.toStringAsFixed(2)}');
  print('Total Price After Tax: \$${totalWithTax.toStringAsFixed(2)}');
}
