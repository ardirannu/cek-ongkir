import 'package:cek_ongkir/app/data/models/city_model.dart';
import 'package:cek_ongkir/app/modules/home/controllers/home_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:get/get.dart';

class CityDropdown extends StatelessWidget {
  final HomeController controller = Get.find();

  final String label;
  final String stateName;

  CityDropdown({
    required this.label,
    required this.stateName,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<City>(
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
        switch (stateName) { //atur api berdasarkan parameter stateName
          case 'cityAsalId':
            var response = await http.get(
              Uri.parse(
                "https://api.rajaongkir.com/starter/city?province=${controller.provAsalId.value}",
              ),
              headers: {"key": "2f8a6ca2bf82a632d09144417549040d"},
            );

            return City.fromJsonList(json.decode(response.body)["rajaongkir"]["results"]);
          case 'cityTujuanId':
            var response = await http.get(
              Uri.parse(
                "https://api.rajaongkir.com/starter/city?province=${controller.provTujuanId.value}",
              ),
              headers: {"key": "2f8a6ca2bf82a632d09144417549040d"},
            );

            return City.fromJsonList(json.decode(response.body)["rajaongkir"]["results"]);
          default:
            return [];
        }
      },
      itemAsString: (City city) => city.cityName,
      onChanged: (value) {
        if(stateName == 'cityAsalId'){
          controller.cityAsalId.value = value?.cityId ?? 0; //set state provAsalId
        }else if(stateName == 'cityTujuanId'){
          controller.cityTujuanId.value = value?.cityId ?? 0; //set state provTujuanId
        }
      }, 
    );
  }
}