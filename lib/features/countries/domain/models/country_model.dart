import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'country_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class CountryModel {
  @HiveField(0)
  final int? count;
  @HiveField(1)
  final double? price;
  @HiveField(2)
  final int? isRent;
  @HiveField(3)
  final double? retailPrice;

  CountryModel({this.count, this.price, this.isRent, this.retailPrice});

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
