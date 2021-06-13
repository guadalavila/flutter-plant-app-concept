class Category {
  final String name;
  final String image;
  final String color;

  Category({required this.name, required this.image, required this.color});

  static List<Category> listCategories = [
    Category(
        name: "Herramientas",
        image: "assets/images/tools.png",
        color: "#E91E63"),
    Category(
        name: "Fertilizantes",
        image: "assets/images/fertilizer.png",
        color: "#F44336"),
    Category(
        name: "Plantas", image: "assets/images/plants.png", color: "##9C27B0"),
    Category(
        name: "Semillas", image: "assets/images/seed.png", color: "#2196F3"),
  ];
}
