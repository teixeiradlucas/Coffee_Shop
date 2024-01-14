import 'package:coffee_shop/constants/components/app_dimension.dart';
import 'package:coffee_shop/constants/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    required this.child,
    super.key,
    this.color = AppColors.blackColor,
    this.size = 60.0,
  });

  final Widget child;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.kPaddingXS),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppDimens.kDefaultPadding,
        ),
        child: Container(
          height: size,
          width: size,
          color: color.withOpacity(0.5),
          child: Center(child: child),
        ),
      ),
    );
  }
}
