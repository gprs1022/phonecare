import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phonecare/constant/enums.dart';
import 'package:phonecare/models/accessories_model.dart';

import '../service/api_services.dart';

class AccessoriesNotifier extends Notifier<ApiStatus> {
  final ApiService apiService = ApiService();
  List<AccessoriesModel> accessoriesList = [];

  @override
  ApiStatus build() {
    return ApiStatus.idle;
  }

  Future<void> getAccessories() async {
    try {
      state = ApiStatus.loading;
      accessoriesList = await apiService.getAccessories();
      state = ApiStatus.success;
      print("product fetched successfully ${accessoriesList.length}");
    } catch (e) {
      state = ApiStatus.error;
      print("error occured $e");
      accessoriesList = [];
    }
  }
}

final accessoriesNotifier = NotifierProvider<AccessoriesNotifier, ApiStatus>(
  AccessoriesNotifier.new,
);
