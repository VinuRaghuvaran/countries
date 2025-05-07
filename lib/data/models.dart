import 'dart:convert';

List<SimpleCountryModel> simpleCountryModelFromJson(String str) =>
    List<SimpleCountryModel>.from(
        json.decode(str).map((x) => SimpleCountryModel.fromJson(x)));

class SimpleCountryModel {
  final String name;
  final String region;
  final String flag;
  final int population;

  SimpleCountryModel({
    required this.name,
    required this.region,
    required this.flag,
    required this.population,
  });

  factory SimpleCountryModel.fromJson(Map<String, dynamic> json) =>
      SimpleCountryModel(
        name: json['name']?['common'] ?? 'Unknown',
        region: json['region'] ?? 'Unknown',
        flag: json['flag'] ?? '',
        population: json['population'] ?? 0,
      );
}
