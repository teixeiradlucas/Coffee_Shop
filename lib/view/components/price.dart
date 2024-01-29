import 'package:coffee_shop/constants/strings/strings_generic.dart';
import 'package:coffee_shop/model/coffee.dart';
import 'package:coffee_shop/model/product.dart';

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

  if (coffee.beverageType == StringsGeneric.espresso) {
    discountPercentage = 0.20;
  } else if (coffee.beverageType == StringsGeneric.cappuccino) {
    discountPercentage = 0.12;
  }

  final discountPrice = coffee.price - (coffee.price * discountPercentage);

  return discountPrice;
}

String textDiscount(Coffee coffee) {
  var discountMessage = '';
  if (coffee.beverageType == StringsGeneric.espresso) {
    discountMessage = StringsGeneric.espressoDiscount;
  } else if (coffee.beverageType == StringsGeneric.cappuccino) {
    discountMessage = StringsGeneric.cappucinoDiscount;
  }
  return discountMessage;
}

String valueDiscount(Coffee coffee) {
  var valueString = coffee.price.toStringAsFixed(2);
  if (coffee.beverageType == StringsGeneric.espresso ||
      coffee.beverageType == StringsGeneric.cappuccino) {
    valueString = valueString.replaceAll('.', ',');
    valueString = 'R\$ $valueString';
  } else {
    valueString = '';
  }
  return valueString;
}

double valueProduct(List<Product> products) {
  var value = 0.0;
  for (final product in products) {
    value += product.quantity * product.coffee.price;
  }

  return value;
}

double valueProductDiscont(List<Product> products) {
  var discountTotal = 0.0;

  for (final product in products) {
    final productTotal = product.quantity * product.coffee.price;

    if (product.coffee.beverageType == StringsGeneric.espresso) {
      discountTotal += productTotal * 0.20;
    } else if (product.coffee.beverageType == StringsGeneric.cappuccino) {
      discountTotal += productTotal * 0.12;
    }
  }

  return discountTotal;
}

double valueProductFinal(List<Product> products) {
  final valueFinal = valueProduct(products) - valueProductDiscont(products);

  return valueFinal;
}
