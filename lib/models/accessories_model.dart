import 'package:phonecare/view_model/service/api_config.dart';

class AccessoriesModel {
  final String id;
  final String categoryId;
  final String productName;
  final String productDescription;
  final int price;
  final int condition;
  final int rating;
  final int storage;
  final String battery;
  final String processor;
  final int ram;
  final int originalPrice;
  final List<String> images;
  final Brand? brand;

  AccessoriesModel({
    required this.id,
    required this.categoryId,
    required this.productName,
    required this.productDescription,
    required this.price,
    required this.condition,
    required this.storage,
    required this.battery,
    required this.processor,
    required this.ram,
    required this.originalPrice,
    required this.rating,
    required this.images,
    required this.brand,
  });

  factory AccessoriesModel.fromJson(Map<String, dynamic> json) {
    return AccessoriesModel(
      id: json['_id'] ?? "",
      categoryId: json['category'] ?? "",
      productName: json['productName'] ?? "",
      productDescription: json['productDescription'] ?? "",
      price: json['price'] ?? 0,
      condition: json['condition'] ?? 0,
      rating: json['rating'] ?? 0,
      storage: json['storage'] ?? 0,
      ram: json['ram'] ?? 0,
      battery: json['battery'] ?? "",
      processor: json['processor'] ?? "",
      originalPrice: json['originalPrice'] ?? 0,
      images: List<String>.from(
        json['images'] != null
            ? List<String>.from(
                json['images'].map((img) => '${ApiConfig.baseUrl}/$img'),
              )
            : [],
      ),
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'category': categoryId,
      'productName': productName,
      'productDescription': productDescription,
      'price': price,
      'storage': storage,
      'ram': ram,
      'battery': battery,
      'processor': processor,
      'originalPrice': originalPrice,
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
    return Brand(id: json['_id'] ?? "", name: json['name'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name};
  }
}
