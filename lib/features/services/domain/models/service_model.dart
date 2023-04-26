import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'service_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class ServiceModel {
  @HiveField(0)
  final String? shortName;
  @HiveField(1)
  final int? sellTop;
  @HiveField(2)
  final bool? forward;
  @HiveField(3)
  final int? totalCount;
  @HiveField(4)
  final double? minPrice;
  @HiveField(5)
  final double? minFreePrice;
  @HiveField(6)
  final int? countWithFreePrice;
  @HiveField(7)
  final bool? onlyRent;

  ServiceModel(
      {this.shortName,
      this.sellTop,
      this.forward,
      this.totalCount,
      this.minPrice,
      this.minFreePrice,
      this.countWithFreePrice,
      this.onlyRent});

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
