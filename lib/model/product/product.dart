class ProductModel {
  String id;
  String name;
  String description;
  String category;
  String image;
  double price;
  String brand;
  bool offer;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.image,
    required this.offer,
    required this.price,
    required this.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        category: json['category'] as String,
        image: json['image'] as String,
        price: (json['price'] is int)
            ? (json['price'] as int).toDouble()
            : json['price'] as double,
        brand: json['brand'] as String,
        offer: json['offer'] as bool,
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'category': category,
        'image': image,
        'price': double.parse(price.toString()).toString(),
        'brand': brand,
        'offer': offer,
      };
}
