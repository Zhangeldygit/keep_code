// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryModelAdapter extends TypeAdapter<CountryModel> {
  @override
  final int typeId = 1;

  @override
  CountryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryModel(
      count: fields[0] as int?,
      price: fields[1] as double?,
      isRent: fields[2] as int?,
      retailPrice: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, CountryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.isRent)
      ..writeByte(3)
      ..write(obj.retailPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      count: json['count'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      isRent: json['isRent'] as int?,
      retailPrice: (json['retailPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'price': instance.price,
      'isRent': instance.isRent,
      'retailPrice': instance.retailPrice,
    };
