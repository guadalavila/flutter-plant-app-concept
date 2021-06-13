class Plant {
  final String code;
  final String name;
  final String description;
  final String imageUrl;
  final int price;
  final bool stock;
  final bool houseplant;

  Plant(
      {required this.code,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.stock,
      required this.houseplant});

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
        code: json['code'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        price: json['price'],
        stock: json['stock'],
        houseplant: json['houseplant']);
  }
}
