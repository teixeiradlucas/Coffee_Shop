import 'package:app_pc_store/constants/strings/strings_generic.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(AppStringsGeneric.appName),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shop_2_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Monte seu pc'),
          ),
          Row(
            children: [
              TextButton(onPressed: () {}, child: const Text('Processador')),
              TextButton(onPressed: () {}, child: const Text('Placa mãe')),
              TextButton(onPressed: () {}, child: const Text('Placa de vídeo')),
              TextButton(onPressed: () {}, child: const Text('Memória ram')),
              TextButton(onPressed: () {}, child: const Text('Gabinete')),
              TextButton(onPressed: () {}, child: const Text('Processador')),
            ],
          ),
        ],
      ),
    );
  }
}
