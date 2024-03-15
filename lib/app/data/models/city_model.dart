class City {
  final int cityId;
  final int provinceId;
  final String province;
  final String type;
  final String cityName;
  final String postalCode;

  City({required this.cityId, required this.provinceId, required this.province, required this.type, 
  required this.cityName, required this.postalCode});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      cityId: int.parse(json['city_id']),
      provinceId: int.parse(json['province_id']),
      province: json['province'],
      type: json['type'],
      cityName: json['city_name'],
      postalCode: json['postal_code'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['province_id'] = provinceId;
    data['province'] = province;
    data['type'] = type;
    data['city_name'] = cityName;
    data['postal_code'] = postalCode;
    return data;
  }

  static List<City> fromJsonList(List? data){
    if(data == null || data.length == 0) return [];
    return data.map((e) => City.fromJson(e)).toList();
  }

  @override
  String toString() => cityName;
}
