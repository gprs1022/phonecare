import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phonecare/constant/enums.dart';
import 'package:phonecare/view_model/service/api_services.dart';

import '../../models/homepage_model.dart';


class HomeNotifier extends Notifier<ApiStatus> {
  final ApiService apiService = ApiService();
  List<SliderModel> sliders = [];

  List<BrandModel> brands = [];

  List<PhoneModel> phones = [];

  @override
  ApiStatus build() {
    return ApiStatus.idle;
  }

  Future<void> getSlider() async {
    try {
      state = ApiStatus.loading;
      sliders = await apiService.getSlider();
      state = ApiStatus.success;
      print("Slider fetched successfully, total: ${sliders.length}");
    } catch (e) {
      state = ApiStatus.error;
      print("Error fetching slider: $e");
    }
  }

  Future<List<BrandModel>> getBrands() async {
    print("Fetching brands... xxx");
    try{
      state = ApiStatus.loading;
      brands = await apiService.getBrands();
      state = ApiStatus.success;
      print("Brands fetched successfully, total: ${brands.length}");
      return brands;
    } catch (e) {
      state = ApiStatus.error;
      print("Error fetching brands: $e");
      return [];
    }
  }

  Future<List<PhoneModel>> getPhoneByBrandId(String brandId) async{
    print("Fetching phones by brandId: $brandId");
    try{
      state = ApiStatus.loading;
      phones = await apiService.getPhonesByBrandId(brandId);
      state = ApiStatus.success;
      print("Phones fetched successfully, total: ${phones.length}");
      return phones;
    } catch(e) {
      state = ApiStatus.error;
      print("Error fetching phones by brandId: $e");
      return [];
    }
  }
}

final homeNotifierProvider = NotifierProvider<HomeNotifier, ApiStatus>(HomeNotifier.new);
