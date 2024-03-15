class Province {
  final int provinceId;
  final String provinceName;

  Province({required this.provinceId, required this.provinceName});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      provinceId: int.parse(json['province_id']),
      provinceName: json['province'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['province_id'] = provinceId;
    data['province'] = provinceName;

    return data;
  }

  static List<Province> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Province.fromJson(json)).toList();
  }

  @override
  String toString() => provinceName; //tambahkan supaya pencarian di dropdownsearch menggunakan provinceName
}
