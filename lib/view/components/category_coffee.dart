import 'package:coffee_shop/constants/components/dimension_custom.dart';
import 'package:coffee_shop/constants/components/text_custom.dart';
import 'package:coffee_shop/constants/strings/strings_generic.dart';
import 'package:coffee_shop/model/coffee.dart';
import 'package:coffee_shop/view/components/coffe_item_type.dart';
import 'package:flutter/material.dart';

class CategoryCoffee extends StatelessWidget {
  const CategoryCoffee({
    required this.activeCoffees,
    super.key,
  });

  final List<Coffee> activeCoffees;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Expanded(
        child: Column(
          children: [
            TabBar(
              onTap: (selectedTabIndex) {},
              tabs: [
                Tab(child: TextCustom.body2(StringsGeneric.espresso)),
                Tab(child: TextCustom.body2(StringsGeneric.cappuccino)),
                Tab(child: TextCustom.body2(StringsGeneric.latte)),
                Tab(child: TextCustom.body2(StringsGeneric.medium)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _listCoffee(StringsGeneric.espresso),
                  _listCoffee(StringsGeneric.cappuccino),
                  _listCoffee(StringsGeneric.latte),
                  _listCoffee(StringsGeneric.medium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect _listCoffee(String type) {
    final typeCoffee =
        activeCoffees.where((coffee) => coffee.beverageType == type).toList();
    return ClipRRect(
      borderRadius: BorderRadius.circular(kPaddingXL),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: typeCoffee.length,
        itemBuilder: (context, index) {
          final coffee = typeCoffee[index];
          return CoffeeItemType(itemCoffee: coffee);
        },
      ),
    );
  }
}
