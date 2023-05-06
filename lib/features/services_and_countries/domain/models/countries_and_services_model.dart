import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'countries_and_services_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class CountriesAndServicesModel {
  @HiveField(0)
  final Map<String, dynamic>? operators;
  @HiveField(1)
  final Map<String, CountryEntry>? countries;
  @HiveField(2)
  final Map<String, dynamic>? services;
  @HiveField(3)
  final Map<String, dynamic>? anyOperator;

  CountriesAndServicesModel(
      {this.operators, this.countries, this.services, this.anyOperator});

  factory CountriesAndServicesModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesAndServicesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CountriesAndServicesModelToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 5)
class CountryEntry {
  @HiveField(0)
  final String? ru;
  @HiveField(1)
  final String? en;
  @HiveField(2)
  final String? cn;
  @HiveField(3)
  final String? regionCode;
  @HiveField(4)
  final int? ms;

  CountryEntry({
    this.ru,
    this.en,
    this.cn,
    this.regionCode,
    this.ms,
  });

  factory CountryEntry.fromJson(Map<String, dynamic> json) =>
      _$CountryEntryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryEntryToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 4)
class ServiceEntry {
  @HiveField(0)
  final String? ru;
  @HiveField(1)
  final String? en;
  @HiveField(2)
  final String? keywords;
  @HiveField(3)
  final String? id;
  @HiveField(4)
  final String? sellTop;

  ServiceEntry({
    this.ru,
    this.en,
    this.keywords,
    this.id,
    this.sellTop,
  });

  factory ServiceEntry.fromJson(Map<String, dynamic> json) =>
      _$ServiceEntryFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceEntryToJson(this);
}
