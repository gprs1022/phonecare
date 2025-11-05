import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/controller/address_controller.dart';

class AddressScreen extends ConsumerWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressProvider = ref.watch(AddressProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Address')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: addressProvider.nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.person, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: addressProvider.emailController,
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                prefixIcon: Icon(Icons.email, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: addressProvider.phoneController,
              decoration: InputDecoration(
                hintText: 'Enter Your Phone Number',
                prefixIcon: Icon(Icons.phone, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: addressProvider.addressController,
              decoration: InputDecoration(
                hintText: 'Address',
                prefixIcon: Icon(
                  Icons.location_on_rounded,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Save your Address",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
