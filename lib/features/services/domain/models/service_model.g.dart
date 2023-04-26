// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceModelAdapter extends TypeAdapter<ServiceModel> {
  @override
  final int typeId = 0;

  @override
  ServiceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceModel(
      shortName: fields[0] as String?,
      sellTop: fields[1] as int?,
      forward: fields[2] as bool?,
      totalCount: fields[3] as int?,
      minPrice: fields[4] as double?,
      minFreePrice: fields[5] as double?,
      countWithFreePrice: fields[6] as int?,
      onlyRent: fields[7] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ServiceModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.shortName)
      ..writeByte(1)
      ..write(obj.sellTop)
      ..writeByte(2)
      ..write(obj.forward)
      ..writeByte(3)
      ..write(obj.totalCount)
      ..writeByte(4)
      ..write(obj.minPrice)
      ..writeByte(5)
      ..write(obj.minFreePrice)
      ..writeByte(6)
      ..write(obj.countWithFreePrice)
      ..writeByte(7)
      ..write(obj.onlyRent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      shortName: json['shortName'] as String?,
      sellTop: json['sellTop'] as int?,
      forward: json['forward'] as bool?,
      totalCount: json['totalCount'] as int?,
      minPrice: (json['minPrice'] as num?)?.toDouble(),
      minFreePrice: (json['minFreePrice'] as num?)?.toDouble(),
      countWithFreePrice: json['countWithFreePrice'] as int?,
      onlyRent: json['onlyRent'] as bool?,
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'shortName': instance.shortName,
      'sellTop': instance.sellTop,
      'forward': instance.forward,
      'totalCount': instance.totalCount,
      'minPrice': instance.minPrice,
      'minFreePrice': instance.minFreePrice,
      'countWithFreePrice': instance.countWithFreePrice,
      'onlyRent': instance.onlyRent,
    };
