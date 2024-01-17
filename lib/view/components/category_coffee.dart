import 'package:coffee_shop/constants/components/app_dimension.dart';
import 'package:coffee_shop/constants/components/custom_text.dart';
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
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            onTap: (selectedTabIndex) {},
            tabs: [
              Tab(child: CustomText.body2('Espresso')),
              Tab(child: CustomText.body2('Cappuccino')),
              Tab(child: CustomText.body2('Latte')),
              Tab(child: CustomText.body2('Mocha')),
            ],
          ),
          SizedBox(
            height: size.height * 0.28,
            width: size.width,
            child: TabBarView(
              children: [
                _listCoffee(size, 'Espresso'),
                _listCoffee(size, 'Cappuccino'),
                _listCoffee(size, 'Latte'),
                _listCoffee(size, 'Mocha'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect _listCoffee(Size size, String type) {
    final typeCoffee =
        activeCoffees.where((coffee) => coffee.beverageType == type).toList();
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimens.kPaddingXL),
      child: SizedBox(
        height: size.height * 0.28,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: typeCoffee.length,
          itemBuilder: (context, index) {
            final coffee = typeCoffee[index];
            return CoffeeItemType(itemCoffee: coffee);
          },
        ),
      ),
    );
  }
}
