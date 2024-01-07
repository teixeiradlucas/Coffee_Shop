import 'package:app_coffee_shop/model/coffee.dart';

String finalPrice(Coffee coffee) {
  final valorPrice = formattedPrice(finalDiscount(coffee));

  return valorPrice;
}

String formattedPrice(double valor) {
  var valorString = valor.toStringAsFixed(2);
  valorString = valorString.replaceAll('.', ',');
  valorString = 'R\$ $valorString';

  return valorString;
}

double finalDiscount(Coffee coffee) {
  var discountPercentage = 0.0;

  if (coffee.beverageType == 'Espresso') {
    discountPercentage = 0.20;
  } else if (coffee.beverageType == 'Cappuccino') {
    discountPercentage = 0.12;
  }

  final discountPrice = coffee.price - (coffee.price * discountPercentage);

  return discountPrice;
}

String textDiscount(Coffee coffee) {
  var discountMessage = '';
  if (coffee.beverageType == 'Espresso') {
    discountMessage = '20% OFF';
  } else if (coffee.beverageType == 'Cappuccino') {
    discountMessage = '12% OFF';
  }
  return discountMessage;
}
