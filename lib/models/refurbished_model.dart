class RefurbishedModel{

  final String id;
  final String productName;
  final String productDescription;
  final int price;
  final int condition;
  final int rating;
  final List<String> images;
  final Brand? brand;

  RefurbishedModel({
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.price,
    required this.condition,
    required this.rating,
    required this.images,
    required this.brand,
  });

  factory RefurbishedModel.fromJson(Map<String, dynamic> json) {
    return RefurbishedModel(
      id: json['_id'] ?? " ",
      productName: json['productName'] ?? " ",
      productDescription: json['productDescription'] ?? " ",
      price: json['price'] ?? 0,
      condition: json['condition'] ?? 0,
      rating: json['rating'] ?? 0,
      images: List<String>.from(json['images'] != null ? List<String>.from(json['images']) : []),
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'productName': productName,
      'productDescription': productDescription,
      'price': price,
      'condition': condition,
      'rating': rating,
      'images': images,
      'brand': brand?.toJson(),
    };
  }
}


class Brand {
  final String id;
  final String name;

  Brand({required this.id, required this.name});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'] ??" ",
      name: json['name'] ?? " ",
    );

  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}



