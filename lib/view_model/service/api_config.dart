class ApiConfig {
  static const baseUrl = "https://mobimist.technopediasoft.com";

  static const login = "${baseUrl}/api/v1/auth/authenticate";

  static const verifyOtp = "${baseUrl}/api/v1/auth/verify-otp";

  static const getSlider = "${baseUrl}/api/v1/slider";

  static const getBrands = "${baseUrl}/api/v1/brand/all";

  static String getPhoneByBrandId(String brandId) {
    return "$baseUrl/api/v1/phone/brand/$brandId";
  }

  static const getRefurbishedPhones = "${baseUrl}/api/v1/refurbish";
  static const getAccessories = "${baseUrl}/api/v1/accessories";
}
