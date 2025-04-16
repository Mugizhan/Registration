import 'package:equatable/equatable.dart';
import '../form_bloc/form_event.dart';

class RegisterState extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String dob;
  final String street;
  final String state;
  final String country;
  final String gender;
  final String about;
  final String password;
  final String confirmPassword;
  final String termsAccepted;
  final FormStatus formStatus;

  final bool isNameValid;
  final bool isEmailValid;
  final bool isPhoneValid;
  final bool isDobValid;
  final bool isStreetValid;
  final bool isStateValid;
  final bool isCountryValid;
  final bool isGenderValid;
  final bool isAboutValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final bool isTermsAccepted;

  const RegisterState({
    this.name = '',
    this.email = '',
    this.phoneNumber = '',
    this.dob = '',
    this.street = '',
    this.state = '',
    this.country = '',
    this.gender = '',
    this.about = '',
    this.password = '',
    this.confirmPassword = '',
    this.termsAccepted = '',
    this.formStatus = const FormInitial(),

    this.isNameValid = true,
    this.isEmailValid = true,
    this.isPhoneValid = true,
    this.isDobValid = true,
    this.isStreetValid = true,
    this.isStateValid = true,
    this.isCountryValid = true,
    this.isGenderValid = true,
    this.isAboutValid = true,
    this.isPasswordValid = true,
    this.isConfirmPasswordValid = true,
    this.isTermsAccepted = true,
  });

  bool get isValid =>
      isNameValid &&
          isEmailValid &&
          isPhoneValid &&
          isDobValid &&
          isStreetValid &&
          isStateValid &&
          isCountryValid &&
          isGenderValid &&
          isAboutValid &&
          isPasswordValid &&
          isConfirmPasswordValid &&
          isTermsAccepted;

  RegisterState copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? dob,
    String? street,
    String? state,
    String? country,
    String? gender,
    String? about,
    String? password,
    String? confirmPassword,
    String? termsAccepted,
    FormStatus? formStatus,
    bool? isNameValid,
    bool? isEmailValid,
    bool? isPhoneValid,
    bool? isDobValid,
    bool? isStreetValid,
    bool? isStateValid,
    bool? isCountryValid,
    bool? isGenderValid,
    bool? isAboutValid,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
    bool? isTermsAccepted,
  }) {
    return RegisterState(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dob: dob ?? this.dob,
      street: street ?? this.street,
      state: state ?? this.state,
      country: country ?? this.country,
      gender: gender ?? this.gender,
      about: about ?? this.about,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      termsAccepted: termsAccepted ?? this.termsAccepted,
      formStatus: formStatus ?? this.formStatus,

      isNameValid: isNameValid ?? this.isNameValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
      isDobValid: isDobValid ?? this.isDobValid,
      isStreetValid: isStreetValid ?? this.isStreetValid,
      isStateValid: isStateValid ?? this.isStateValid,
      isCountryValid: isCountryValid ?? this.isCountryValid,
      isGenderValid: isGenderValid ?? this.isGenderValid,
      isAboutValid: isAboutValid ?? this.isAboutValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid: isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
    );
  }

  @override
  List<Object?> get props => [
    name,
    email,
    phoneNumber,
    dob,
    street,
    state,
    country,
    gender,
    about,
    password,
    confirmPassword,
    termsAccepted,
    formStatus,
    isNameValid,
    isEmailValid,
    isPhoneValid,
    isDobValid,
    isStreetValid,
    isStateValid,
    isCountryValid,
    isGenderValid,
    isAboutValid,
    isPasswordValid,
    isConfirmPasswordValid,
    isTermsAccepted,
  ];
}
