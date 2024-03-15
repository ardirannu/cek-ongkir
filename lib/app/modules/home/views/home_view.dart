import 'package:cek_ongkir/app/modules/home/widgets/dropdown_city.dart';
import 'package:cek_ongkir/app/modules/home/widgets/dropdown_courier.dart';
import 'package:cek_ongkir/app/modules/home/widgets/dropdown_province.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Cek Ongkir")),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 16, 131, 255),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          ProvinceDropdown(
            label: "Provinsi Asal",
            stateName: "provAsalId",
          ),
          SizedBox(height: 15,),
          CityDropdown(
            label: "Kota Asal",
            stateName: "cityAsalId",
          ),
          SizedBox(height: 15,),
          ProvinceDropdown(
            label: "Provinsi Tujuan",
            stateName: "provTujuanId",
          ),
          SizedBox(height: 15,),
          CityDropdown(
            label: "Kota Tujuan",
            stateName: "cityTujuanId",
          ),
          SizedBox(height: 15,),
          CourierDropdown(
            items: [
              {"code": "jne", "name": "JNE"},
              {"code": "pos", "name": "POS Indonesia"},
              {"code": "tiki", "name": "TIKI"}
            ],
            label: "Pilih Kurir",
          ),
          SizedBox(height: 15,),
          TextField(
            controller: controller.beratC,
            autocorrect: false,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Berat Barang',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
          SizedBox(height: 15,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 0, 136, 255),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Setel radius sesuai keinginan
              ),
            ),
            onPressed: () => controller.cekOngkir(),
            child: Text("Cek Ongkir"),
          )
        ],
      )
    );
  }
}
