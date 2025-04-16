import 'package:json_annotation/json_annotation.dart';
part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'number')
  final int phoneNumber;
  @JsonKey(name: 'dob')
  final DateTime dob;
  @JsonKey(name: 'address')
  final Address address;
  @JsonKey(name: 'gender')
  final String gender;
  @JsonKey(name: 'about')
  final String about;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'condition')
  final bool condition;

  RegisterModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.dob,
    required this.address,
    required this.gender,
    required this.about,
    required this.password,
    required this.condition,
  });

  factory RegisterModel.fromJson(Map<String,dynamic> json)=>_$RegisterModelFromJson(json);

  Map<String,dynamic> toJson()=>_$RegisterModelToJson(this);

}


@JsonSerializable()
class Address{
  
    final String street;
    final String state;
    final String country;
    const Address({required this.street,required this.state,required this.country});

    factory Address.fromJson(Map<String,dynamic> json)=>_$AddressFromJson(json);

    Map<String,dynamic> toJson()=>_$AddressToJson(this);

}