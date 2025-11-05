import 'package:phonecare/view_model/service/api_config.dart';

class AccessoriesModel {
  final String id;
  final Brand? brand;
  final String productName;
  final int originalPrice;
  final int price;
  final int tax;
  final int rating;
  final int reviewCount;
  final String categoryId;
  final List<String> images;
  final String productDescription;

  AccessoriesModel({
    required this.id,
    required this.brand,
    required this.productName,
    required this.originalPrice,
    required this.price,
    required this.tax,
    required this.rating,
    required this.reviewCount,
    required this.categoryId,
    required this.images,
    required this.productDescription,
  });

  factory AccessoriesModel.fromJson(Map<String, dynamic> json) {
    return AccessoriesModel(
      id: json['_id'] ?? "",
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      productName: json['name'] ?? "",
      originalPrice: json['originalPrice'] ?? 0,
      price: json['price'] ?? 0,
      tax: json['tax'] ?? 0,
      rating: json['rating'] ?? 0,
      reviewCount: json['reviewCount'] ?? 0,
      categoryId: json['category'] ?? "",
      images: List<String>.from(
        json['images'] != null
            ? List<String>.from(
                json['images'].map(
                  (imagePath) => '${ApiConfig.baseUrl}/$imagePath',
                ),
              )
            : [],
      ),
      productDescription: json['description'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'brand': brand?.toJson(),
      'productName': productName,
      'originalPrice': originalPrice,
      'price': price,
      'tax': tax,
      'rating': rating,
      'reviewCount': reviewCount,
      'category': categoryId,
      'images': images,
      'productDescription': productDescription,
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
