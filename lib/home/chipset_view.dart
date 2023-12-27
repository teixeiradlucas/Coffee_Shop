import 'package:app_pc_store/constants/strings/strings_generic.dart';
import 'package:flutter/material.dart';

class ChipsetView extends StatelessWidget {
  const ChipsetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStringsGeneric.nameChipset),
      ),
      body: const SizedBox(),
    );
  }
}
