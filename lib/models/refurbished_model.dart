import 'package:phonecare/view_model/service/api_config.dart';

class RefurbishedModel {
  final int tax;
  final String id;
  final String productName;
  final String productDescription;
  final Brand? brand;
  final int price;
  final int condition;
  final int rating;
  final List<String> images;
  final int storage;
  final int ram;
  final String battery;
  final String processor;
  final int originalPrice;
  final String categoryId;

  RefurbishedModel({
    required this.tax,
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.brand,
    required this.price,
    required this.condition,
    required this.rating,
    required this.images,
    required this.storage,
    required this.ram,
    required this.battery,
    required this.processor,
    required this.originalPrice,
    required this.categoryId,
  });

  factory RefurbishedModel.fromJson(Map<String, dynamic> json) {
    return RefurbishedModel(
      tax: json['tax'] ?? 0,
      id: json['_id'] ?? " ",
      productName: json['productName'] ?? " ",
      productDescription: json['productDescription'] ?? " ",
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      price: json['price'] ?? 0,
      condition: json['condition'] ?? 0,
      rating: json['rating'] ?? 0,
      images: List<String>.from(
        json['images'] != null
            ? List<String>.from(
                json['images'].map(
                  (imagePath) => '${ApiConfig.baseUrl}/$imagePath',
                ),
              )
            : [],
      ),
      storage: json['storage'] ?? 0,
      ram: json['ram'] ?? 0,
      battery: json['battery'] ?? " ",
      processor: json['processor'] ?? " ",
      originalPrice: json['originalPrice'] ?? 0,
      categoryId: json['categoryId'] ?? " ",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tax': tax,
      '_id': id,
      'productName': productName,
      'productDescription': productDescription,
      'brand': brand?.toJson(),
      'price': price,
      'condition': condition,
      'rating': rating,
      'images': images,
      'storage': storage,
      'ram': ram,
      'battery': battery,
      'processor': processor,
      'originalPrice': originalPrice,
      'categoryId': categoryId,
    };
  }
}

class Brand {
  final String id;
  final String name;

  Brand({required this.id, required this.name});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(id: json['_id'] ?? " ", name: json['name'] ?? " ");
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name};
  }
}
