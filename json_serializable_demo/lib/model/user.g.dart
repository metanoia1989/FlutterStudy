// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['registration_date_millis'] as int, json['name'] as String,
      json['email'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'registration_date_millis': instance.registrationDateMillis,
      'name': instance.name,
      'email': instance.email
    };
