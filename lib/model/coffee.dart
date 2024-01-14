// ignore_for_file: lines_longer_than_80_chars

class Coffee {
  Coffee({
    required this.id,
    required this.name,
    required this.intensity,
    required this.beverageType,
    required this.price,
    required this.isAtive,
    required this.bestSellers,
    required this.imageAssets,
    required this.description,
    required this.rating,
  });
  final int id;
  final String name;
  final int intensity;
  final String beverageType;
  final double price;
  final bool isAtive;
  final bool bestSellers;
  final String imageAssets;
  final String description;
  final double rating;
}

List<Coffee> coffees = [
  Coffee(
    id: 1,
    name: 'Espresso Intenso',
    intensity: 9,
    beverageType: 'Espresso',
    price: 3.50,
    isAtive: true,
    bestSellers: true,
    imageAssets: 'assets/images/espresso1.jpg',
    description:
        'Um espresso intenso com uma mistura robusta e sabor marcante.',
    rating: 7.5,
  ),
  Coffee(
    id: 2,
    name: 'Espresso Gelado',
    intensity: 7,
    beverageType: 'Espresso',
    price: 4.1,
    isAtive: true,
    bestSellers: false,
    imageAssets: 'assets/images/espresso2.jpg',
    description:
        'Uma deliciosa combinação de espresso intenso, servido refrescante sobre gelo.',
    rating: 7.2,
  ),
  Coffee(
    id: 3,
    name: 'Espresso',
    intensity: 7,
    beverageType: 'Espresso',
    price: 3.75,
    isAtive: true,
    bestSellers: false,
    imageAssets: 'assets/images/espresso3.jpg',
    description:
        'Um clássico espresso, preparado com grãos cuidadosamente selecionados para proporcionar um equilíbrio perfeito entre intensidade e aroma.',
    rating: 9.5,
  ),
  Coffee(
    id: 4,
    name: 'Espresso Barista',
    intensity: 6,
    beverageType: 'Espresso',
    price: 3.90,
    isAtive: true,
    bestSellers: false,
    imageAssets: 'assets/images/espresso4.jpg',
    description:
        'O Espresso Barista é uma obra-prima para os verdadeiros entusiastas de café.',
    rating: 8.4,
  ),
  Coffee(
    id: 5,
    name: 'Cappuccino',
    intensity: 3,
    beverageType: 'Cappuccino',
    price: 5.50,
    isAtive: true,
    bestSellers: true,
    imageAssets: 'assets/images/cappuccino1.jpg',
    description:
        'O clássico Cappuccino oferece uma experiência indulgente de café, combinando espresso, leite vaporizado e uma generosa camada de espuma de leite.',
    rating: 9.5,
  ),
  Coffee(
    id: 6,
    name: 'Cappuccino Doce de Leite',
    intensity: 4,
    beverageType: 'Cappuccino',
    price: 6,
    isAtive: true,
    bestSellers: false,
    imageAssets: 'assets/images/cappuccino2.jpg',
    description:
        'O Cappuccino Doce de Leite é uma explosão de sabores suaves e doces. Este cappuccino combina a cremosidade do leite com a doçura irresistível do doce de leite, resultando em uma experiência única e reconfortante.',
    rating: 7.8,
  ),
  Coffee(
    id: 7,
    name: 'Cappuccino Gelado',
    intensity: 3,
    beverageType: 'Cappuccino',
    price: 5.75,
    isAtive: true,
    bestSellers: true,
    imageAssets: 'assets/images/cappuccino3.jpg',
    description:
        'O Cappuccino Gelado é a escolha perfeita para quem busca uma experiência refrescante e indulgente. ',
    rating: 8.6,
  ),
  Coffee(
    id: 8,
    name: 'Cappuccino Zero Lactose',
    intensity: 4,
    beverageType: 'Cappuccino',
    price: 6.20,
    isAtive: true,
    bestSellers: false,
    imageAssets: 'assets/images/cappuccino4.jpg',
    description:
        'O Cappuccino Zero Lactose é a escolha ideal para os amantes de café que procuram uma opção livre de lactose, sem abrir mão do sabor.',
    rating: 7.4,
  ),
  Coffee(
    id: 9,
    name: 'Cappuccino Vanilla',
    intensity: 3,
    beverageType: 'Cappuccino',
    price: 5.90,
    isAtive: true,
    bestSellers: false,
    imageAssets: 'assets/images/cappuccino5.jpg',
    description:
        'O Cappuccino Vanilla é uma experiência deliciosamente aromática que combina a suavidade do leite, a intensidade do espresso e o irresistível sabor da baunilha.',
    rating: 6.5,
  ),
  Coffee(
    id: 10,
    name: 'Latte Avelã',
    intensity: 3,
    beverageType: 'Latte',
    price: 6,
    isAtive: true,
    bestSellers: false,
    imageAssets: 'assets/images/latte1.jpg',
    description:
        'O Latte Avelã é uma indulgência suave e aromática que combina a cremosidade do leite, a intensidade do espresso e o irresistível sabor da avelã.',
    rating: 9.1,
  ),
  Coffee(
    id: 11,
    name: 'Latte Macchiato',
    intensity: 3,
    beverageType: 'Latte',
    price: 6.25,
    isAtive: true,
    bestSellers: false,
    imageAssets: 'assets/images/latte2.jpg',
    description:
        'O Latte Macchiato é uma obra-prima de camadas perfeitas, combinando a suavidade do leite com a intensidade do espresso.',
    rating: 8.3,
  ),
  Coffee(
    id: 12,
    name: 'Frappe Gelado',
    intensity: 2,
    beverageType: 'Latte',
    price: 5.75,
    isAtive: true,
    bestSellers: true,
    imageAssets: 'assets/images/latte3.jpg',
    description:
        'O Frappe Gelado é a escolha refrescante e energizante para os amantes de café. Preparado com espresso gelado, leite e uma generosa porção de gelo, este latte proporciona uma experiência revigorante e saborosa.',
    rating: 9.4,
  ),
  Coffee(
    id: 13,
    name: 'Frappe',
    intensity: 3,
    beverageType: 'Latte',
    price: 6.50,
    isAtive: true,
    bestSellers: true,
    imageAssets: 'assets/images/latte4.jpg',
    description:
        'O Frappe é uma deliciosa mistura de espresso, leite e gelo, resultando em uma bebida gelada e revigorante.',
    rating: 8.2,
  ),
  Coffee(
    id: 14,
    name: 'Mocha',
    intensity: 4,
    beverageType: 'Mocha',
    price: 4.50,
    isAtive: true,
    bestSellers: false,
    imageAssets: 'assets/images/mocha1.jpg',
    description:
        'O Mocha é uma tentação indulgente que combina a riqueza do chocolate com a intensidade do espresso.',
    rating: 7.4,
  ),
  Coffee(
    id: 15,
    name: 'Chococino',
    intensity: 3,
    beverageType: 'Mocha',
    price: 4.75,
    isAtive: true,
    bestSellers: true,
    imageAssets: 'assets/images/mocha2.jpg',
    description:
        'O Chococino é uma indulgência irresistível para os amantes de chocolate e café.',
    rating: 9.6,
  ),
  Coffee(
    id: 16,
    name: 'Chococino Caramel',
    intensity: 4,
    beverageType: 'Mocha',
    price: 4.60,
    isAtive: true,
    bestSellers: false,
    imageAssets: 'assets/images/mocha3.jpg',
    description:
        'O Chococino Caramel é uma experiência luxuosa que combina a suavidade do leite, a intensidade do espresso e a doçura do caramelo.',
    rating: 8.9,
  ),
  Coffee(
    id: 17,
    name: 'Mocha Gelado',
    intensity: 3,
    beverageType: 'Mocha',
    price: 5,
    isAtive: true,
    bestSellers: false,
    imageAssets: 'assets/images/mocha4.jpg',
    description:
        'O Mocha Gelado é uma explosão de frescor e sabor para os amantes de café e chocolate.',
    rating: 8.4,
  ),
];
