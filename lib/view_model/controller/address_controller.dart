
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressNotifier extends Notifier<AddressNotifier> {
  @override
  AddressNotifier build() {
    return AddressNotifier();
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();











}

final AddressProvider = NotifierProvider<AddressNotifier, AddressNotifier>(
  AddressNotifier.new,
);
