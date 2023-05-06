// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_and_services_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountriesAndServicesModelAdapter
    extends TypeAdapter<CountriesAndServicesModel> {
  @override
  final int typeId = 3;

  @override
  CountriesAndServicesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountriesAndServicesModel(
      operators: (fields[0] as Map?)?.cast<String, dynamic>(),
      countries: (fields[1] as Map?)?.cast<String, CountryEntry>(),
      services: (fields[2] as Map?)?.cast<String, dynamic>(),
      anyOperator: (fields[3] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, CountriesAndServicesModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.operators)
      ..writeByte(1)
      ..write(obj.countries)
      ..writeByte(2)
      ..write(obj.services)
      ..writeByte(3)
      ..write(obj.anyOperator);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountriesAndServicesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CountryEntryAdapter extends TypeAdapter<CountryEntry> {
  @override
  final int typeId = 5;

  @override
  CountryEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryEntry(
      ru: fields[0] as String?,
      en: fields[1] as String?,
      cn: fields[2] as String?,
      regionCode: fields[3] as String?,
      ms: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CountryEntry obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.ru)
      ..writeByte(1)
      ..write(obj.en)
      ..writeByte(2)
      ..write(obj.cn)
      ..writeByte(3)
      ..write(obj.regionCode)
      ..writeByte(4)
      ..write(obj.ms);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ServiceEntryAdapter extends TypeAdapter<ServiceEntry> {
  @override
  final int typeId = 4;

  @override
  ServiceEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceEntry(
      ru: fields[0] as String?,
      en: fields[1] as String?,
      keywords: fields[2] as String?,
      id: fields[3] as String?,
      sellTop: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ServiceEntry obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.ru)
      ..writeByte(1)
      ..write(obj.en)
      ..writeByte(2)
      ..write(obj.keywords)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.sellTop);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesAndServicesModel _$CountriesAndServicesModelFromJson(
        Map<String, dynamic> json) =>
    CountriesAndServicesModel(
      operators: json['operators'] as Map<String, dynamic>?,
      countries: (json['countries'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, CountryEntry.fromJson(e as Map<String, dynamic>)),
      ),
      services: json['services'] as Map<String, dynamic>?,
      anyOperator: json['anyOperator'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CountriesAndServicesModelToJson(
        CountriesAndServicesModel instance) =>
    <String, dynamic>{
      'operators': instance.operators,
      'countries': instance.countries,
      'services': instance.services,
      'anyOperator': instance.anyOperator,
    };

CountryEntry _$CountryEntryFromJson(Map<String, dynamic> json) => CountryEntry(
      ru: json['ru'] as String?,
      en: json['en'] as String?,
      cn: json['cn'] as String?,
      regionCode: json['regionCode'] as String?,
      ms: json['ms'] as int?,
    );

Map<String, dynamic> _$CountryEntryToJson(CountryEntry instance) =>
    <String, dynamic>{
      'ru': instance.ru,
      'en': instance.en,
      'cn': instance.cn,
      'regionCode': instance.regionCode,
      'ms': instance.ms,
    };

ServiceEntry _$ServiceEntryFromJson(Map<String, dynamic> json) => ServiceEntry(
      ru: json['ru'] as String?,
      en: json['en'] as String?,
      keywords: json['keywords'] as String?,
      id: json['id'] as String?,
      sellTop: json['sellTop'] as String?,
    );

Map<String, dynamic> _$ServiceEntryToJson(ServiceEntry instance) =>
    <String, dynamic>{
      'ru': instance.ru,
      'en': instance.en,
      'keywords': instance.keywords,
      'id': instance.id,
      'sellTop': instance.sellTop,
    };
