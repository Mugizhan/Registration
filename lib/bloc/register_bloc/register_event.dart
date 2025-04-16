import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object?> get props => [];
}

class NameChanged extends RegisterEvent {
  final String name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class EmailChanged extends RegisterEvent {
  final String email;
  const EmailChanged({required this.email});
  @override
  List<Object?> get props => [email];
}

class PhoneChanged extends RegisterEvent {
  final String phoneNumber;
  const PhoneChanged({required this.phoneNumber});
  @override
  List<Object?> get props => [phoneNumber];
}

class DobChanged extends RegisterEvent {
  final String dob;
  const DobChanged({required this.dob});
  @override
  List<Object?> get props => [dob];
}

class StreetChange extends RegisterEvent {
  final String street;
  const StreetChange({required this.street});
  @override
  List<Object?> get props => [street];
}
class StateChange extends RegisterEvent {
  final String state;
  const StateChange({required this.state});
  @override
  List<Object?> get props => [state];
}
class CountryChanged extends RegisterEvent {
  final String country;
  const CountryChanged({required this.country});
  @override
  List<Object?> get props => [country];
}

class GenderChanged extends RegisterEvent {
  final String gender;
  const GenderChanged({required this.gender});
  @override
  List<Object?> get props => [gender];
}

class AboutChanged extends RegisterEvent {
  final String about;
  const AboutChanged({required this.about});
  @override
  List<Object?> get props => [about];
}

class PasswordChanged extends RegisterEvent {
  final String password;
  const PasswordChanged({required this.password});
  @override
  List<Object?> get props => [password];
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;
  const ConfirmPasswordChanged({required this.confirmPassword});
  @override
  List<Object?> get props => [confirmPassword];
}

class ConditionChanged extends RegisterEvent {
  final String accepted;
  const ConditionChanged({required this.accepted});
  @override
  List<Object?> get props => [accepted];
}

class RegisterSubmit extends RegisterEvent {}
