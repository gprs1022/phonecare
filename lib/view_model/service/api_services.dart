import 'package:phonecare/models/accessories_model.dart';
import 'package:phonecare/models/homepage_model.dart';
import 'package:phonecare/models/refurbished_model.dart';
import 'package:phonecare/view_model/service/api_client.dart';
import 'package:phonecare/view_model/service/api_config.dart';

class ApiService {
  Future<List<SliderModel>> getSlider() async {
    try {
      final response = await ApiClient.dio.get(ApiConfig.getSlider);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List data = response.data['slides'] ?? [];
        return data.map((e) => SliderModel.fromJson(e)).toList();
      } else {
        print("Something went wrong Status: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Exception while fetching slider: $e");
      return [];
    }
  }

  Future<List<BrandModel>> getBrands() async {
    try {
      final response = await ApiClient.dio.get(ApiConfig.getBrands);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Success Status: ${response.statusCode}");
        final List brand = response.data['brands'] ?? [];
        print(brand);
        return brand.map((e) => BrandModel.fromJson(e)).toList();
      } else {
        print("Something went wrong Status: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  //get phones for with model for services
  Future<List<PhoneModel>> getPhonesByBrandId(String brandId) async {
    try {
      final response = await ApiClient.dio.get(
        ApiConfig.getPhoneByBrandId(brandId),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Success Status: ${response.statusCode}");
        final List phone = response.data['phones'] ?? [];
        print(phone);
        return phone.map((e) => PhoneModel.fromJson(e)).toList();
      } else {
        print("Something went wrong Status: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Exception while fetching phones: $e");
      return [];
    }
  }

  //for geting refurbished phones
  Future<List<RefurbishedModel>> getRefurbishedPhones() async {
    try {
      final response = await ApiClient.dio.get(ApiConfig.getRefurbishedPhones);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Success Status: ${response.statusCode}");
        final List refurbished = response.data['products'] ?? [];
        print(refurbished.length);
        return refurbished.map((e) => RefurbishedModel.fromJson(e)).toList();
      } else {
        print("Something went wrong Status: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Exception while fetching refurbished phones: $e");
      return [];
    }
  }

  //for getting accessories
  Future<List<AccessoriesModel>> getAccessories() async {
    try {
      final response = await ApiClient.dio.get(ApiConfig.getAccessories);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Success Status: ${response.statusCode}");
        final List accessories = response.data['accessories'] ?? [];
        return accessories.map((e) => AccessoriesModel.fromJson(e)).toList();
      } else {
        print("Something went wrong Status: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Exception while fetching accessories: $e");
      return [];
    }
  }
}
