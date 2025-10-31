class EmailModel {
  final String email;

  EmailModel({required this.email,});

  factory EmailModel.fromJson(Map<String, dynamic> json) {
    return EmailModel(
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

class UserModel {
  final String id;
  final String name;
  final String email;
  final bool? isVerified;
  final String? role;
  final String? authType;

  UserModel({required this.id, required this.name, required this.email, required this.isVerified, required this.role, required this.authType,});

 factory UserModel.fromJson(Map<String, dynamic> json) {
   return UserModel(
       id: json['id'] ?? '',
       name: json['name'] ?? '',
       email: json['email'] ?? '',
       isVerified: json['isVerified'] ??'',
       role: json['role'] ??'',
       authType: json['authType'] ??'',
   );
  }
  Map<String, dynamic> toJson() {
   return {
     'id': id,
     'name': name,
     'email': email,
     'isVerified': isVerified,
     'role': role,
     'authType': authType,
   };
  }
}

class VerifyOtpModel {
  final bool success;
  final String message;
  final String? accessToken;
  final String? refreshToken;
  final UserModel? user;

  VerifyOtpModel({required this.success, required this.message, required this.accessToken, required this.refreshToken, required this.user,});

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json){
    return VerifyOtpModel(
      success: json['success'],
      message: json['message'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'user': user?.toJson(),
    };
  }
}