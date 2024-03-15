import 'package:cek_ongkir/app/data/models/province_model.dart';
import 'package:cek_ongkir/app/modules/home/controllers/home_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:get/get.dart';

class ProvinceDropdown extends StatelessWidget {
  final HomeController controller = Get.find();

  final String label;
  final String stateName;

  ProvinceDropdown({
    required this.label,
    required this.stateName,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Province>(
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
      popupProps: PopupProps.menu(showSearchBox: true),
      asyncItems: (String filter) async {
        var response = await http.get(
          Uri.parse(
            "https://api.rajaongkir.com/starter/province",
          ),
            headers: {"key": "2f8a6ca2bf82a632d09144417549040d"},
          );

        return Province.fromJsonList(json.decode(response.body)["rajaongkir"]["results"]);
      },
      itemAsString: (Province province) => province.provinceName,
      onChanged: (value) {
        if(stateName == 'provAsalId'){
          controller.provAsalId.value = value?.provinceId ?? 0; //set state provAsalId
        }else if(stateName == 'provTujuanId'){
          controller.provTujuanId.value = value?.provinceId ?? 0; //set state provTujuanId
        }
      }, 
    );
  }
}