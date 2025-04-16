// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: (json['number'] as num).toInt(),
      dob: DateTime.parse(json['dob'] as String),
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      gender: json['gender'] as String,
      about: json['about'] as String,
      password: json['password'] as String,
      condition: json['condition'] as bool,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'number': instance.phoneNumber,
      'dob': instance.dob.toIso8601String(),
      'address': instance.address,
      'gender': instance.gender,
      'about': instance.about,
      'password': instance.password,
      'condition': instance.condition,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
  street: json['street'] as String,
  state: json['state'] as String,
  country: json['country'] as String,
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'street': instance.street,
  'state': instance.state,
  'country': instance.country,
};
