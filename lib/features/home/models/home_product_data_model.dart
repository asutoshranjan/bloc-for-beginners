class ProductDataModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;

  ProductDataModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        image: json["imageUrl"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "imageUrl": image,
        "description": description,
      };
}
