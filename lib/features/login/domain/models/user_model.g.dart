// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 2;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      sessionId: fields[0] as String?,
      balance: fields[1] as String?,
      cashback: fields[2] as String?,
      refreshToken: fields[3] as String?,
      userId: fields[4] as String?,
      email: fields[5] as String?,
      telegramId: fields[6] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.sessionId)
      ..writeByte(1)
      ..write(obj.balance)
      ..writeByte(2)
      ..write(obj.cashback)
      ..writeByte(3)
      ..write(obj.refreshToken)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.telegramId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      sessionId: json['sessionId'] as String?,
      balance: json['balance'] as String?,
      cashback: json['cashback'] as String?,
      refreshToken: json['refreshToken'] as String?,
      userId: json['userId'] as String?,
      email: json['email'] as String?,
      telegramId: json['telegramId'],
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'sessionId': instance.sessionId,
      'balance': instance.balance,
      'cashback': instance.cashback,
      'refreshToken': instance.refreshToken,
      'userId': instance.userId,
      'email': instance.email,
      'telegramId': instance.telegramId,
    };
