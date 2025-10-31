import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phonecare/constant/enums.dart';
import 'package:phonecare/models/refurbished_model.dart';

import '../service/api_services.dart';

class RefurbishedNotifier extends Notifier<ApiStatus> {
  final ApiService apiService = ApiService();

  List<RefurbishedModel> refurishedList = [];

  @override
  ApiStatus build() {
    return ApiStatus.idle;
  }

  Future<List<RefurbishedModel>> getRefurbishedProduct() async {
    try {
      state = ApiStatus.loading;
      refurishedList = await apiService.getRefurbishedPhones();
      state = ApiStatus.success;
      print("product fetched successfully ${refurishedList.length}");
      return refurishedList;
    } catch (e) {
      state = ApiStatus.error;
      print("error occured $e");
      return [];
    }
  }
}

final refurbishedNotifier = NotifierProvider<RefurbishedNotifier, ApiStatus>(
  RefurbishedNotifier.new,
);
