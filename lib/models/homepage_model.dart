class SliderModel {
  final String image;

  SliderModel(this.image);

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(json['image'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'image': image};
  }
}

class BrandModel {
  final String id;
  final String name;
  final String logo;

  BrandModel(this.id, this.name, this.logo);

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(json['_id'], json['name'] ?? '', json['logo'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'logo': logo};
  }
}

class PhoneModel {
  final String id;
  final String modelName;
  final String modelImage;
  final BrandModel? brand;

  PhoneModel(this.id, this.modelName, this.modelImage, this.brand);

  factory PhoneModel.fromJson(Map<String, dynamic> json) {
    return PhoneModel(
      json['_id'],
      json['modelName'] ?? '',
      json['image'] ?? '',
      json['brand'] != null ? BrandModel.fromJson(json['brand']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'modelName': modelName,
      'image': modelImage,
      'brand': brand?.toJson(),
    };
  }
}
