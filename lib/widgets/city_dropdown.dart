import 'package:flutter/material.dart';

class CityDropdown extends StatefulWidget {
  const CityDropdown({super.key});

  @override
  State<CityDropdown> createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  String? selectedCity;
  final List<String> cities = ['Delhi', 'Mumbai', 'Kolkata', 'Patna'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true, // Full width
          value: selectedCity,
          hint: const Text(
            'Select your City',
            style: TextStyle(color: Colors.black54),
          ),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black), // right side arrow
          items: cities.map((String city) {
            return DropdownMenuItem<String>(
              value: city,
              child: Row(
                children: [
                  const Icon(Icons.location_city, color: Colors.black), // Prefix icon
                  const SizedBox(width: 8),
                  Text(city),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              selectedCity = value!;
            });
          },
        ),
      ),
    );
  }
}
