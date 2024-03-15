import 'dart:convert';

import 'package:cek_ongkir/app/data/models/ongkir_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  TextEditingController beratC = TextEditingController();

  RxInt provAsalId = 0.obs;
  RxInt cityAsalId = 0.obs;
  RxInt provTujuanId = 0.obs;
  RxInt cityTujuanId = 0.obs;

  RxString codeKurir = "".obs;

  List<Ongkir> ongkosKirim = [];

  RxBool isLoading = false.obs;

  void cekOngkir() async {
    if(provAsalId != 0 && cityAsalId != 0 && provTujuanId != 0 && cityTujuanId != 0 
      && codeKurir != "" && beratC.text != ""){
      try {
        var response = await http.post(
          Uri.parse('https://api.rajaongkir.com/starter/cost'), 
          headers: {
            "key": "2f8a6ca2bf82a632d09144417549040d",
            "content-type": "application/x-www-form-urlencoded",
          }, 
          body: {
            "origin": cityAsalId.value.toString(),
            "destination": cityTujuanId.value.toString(),
            "weight": beratC.text,
            "courier": codeKurir.value.toString(),
          }
        );

        List ongkir = json.decode(response.body)["rajaongkir"]["results"][0]["costs"];
        ongkosKirim = Ongkir.fromJsonList(ongkir);
        
        Get.defaultDialog(
          title: "Ongkos Kirim :",
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ongkosKirim
              .map((data) => ListTile(
                title: Text("${data.service!.toUpperCase()} (${data.description!})"),
                subtitle: Text(
                  "Rp. ${NumberFormat("#,##0").format(data.cost![0].value)}",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ))
              .toList(), //ubah menjadi list
          ),
        );

      } catch (e) {
        print(e);
        Get.defaultDialog(
          title: "Terjadi Kesalahan.",
          middleText: "Tidak dapat cek ongkir!",
        );
      }
    }else{
      Get.defaultDialog(
        title: "Terjadi Kesalahan.",
        middleText: "Lengkapi form terlebih dahulu!",
      );
    }
  }

}
