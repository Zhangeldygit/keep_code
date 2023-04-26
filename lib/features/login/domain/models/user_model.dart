import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class UserModel {
  @HiveField(0)
  final String? sessionId;
  @HiveField(1)
  final String? balance;
  @HiveField(2)
  final String? cashback;
  @HiveField(3)
  final String? refreshToken;
  @HiveField(4)
  final String? userId;
  @HiveField(5)
  final String? email;
  @HiveField(6)
  final dynamic telegramId;

  UserModel(
      {this.sessionId,
      this.balance,
      this.cashback,
      this.refreshToken,
      this.userId,
      this.email,
      this.telegramId});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
