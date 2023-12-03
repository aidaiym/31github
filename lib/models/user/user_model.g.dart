// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: json['id'] as String,
      createdTime: DateTime.parse(json['createdTime'] as String),
      username: json['username'] as String,
      email: json['email'] as String,
      type: $enumDecode(_$UserTypeEnumMap, json['type']),
      phoneNumber: json['phoneNumber'] as String?,
      aboutUser: json['aboutUser'] as String?,
      photoUrl: json['photoUrl'] as String?,
      userLocation: json['userLocation'] as String?,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'createdTime': instance.createdTime.toIso8601String(),
      'username': instance.username,
      'email': instance.email,
      'type': _$UserTypeEnumMap[instance.type]!,
      'phoneNumber': instance.phoneNumber,
      'aboutUser': instance.aboutUser,
      'photoUrl': instance.photoUrl,
      'userLocation': instance.userLocation,
    };

const _$UserTypeEnumMap = {
  UserType.admin: 'admin',
  UserType.student: 'student',
  UserType.company: 'company',
};
