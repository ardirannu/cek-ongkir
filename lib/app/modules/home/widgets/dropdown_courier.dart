import 'package:cek_ongkir/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';

class CourierDropdown extends StatelessWidget {
  final HomeController controller = Get.find();

  final List<Map<String, dynamic>> items;
  final String label;

  CourierDropdown({required this.items, required this.label});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Map<String, dynamic>>(
      items: items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: label,
          contentPadding: EdgeInsets.symmetric(
            vertical: 7,
            horizontal: 15,
          ),
          border: OutlineInputBorder(),
        ),
      ),
      itemAsString: (Map<String, dynamic> item) => item["name"],
      onChanged: (value) => controller.codeKurir.value = value?['code'] ?? "",
    );
  }
  
}