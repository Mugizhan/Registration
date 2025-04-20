import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form1/data/model/register_model.dart';
import 'package:form1/data/repository/register_repository.dart';
import '../form_bloc/form_event.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository registerRepository;
  RegisterBloc({required this.registerRepository}) : super(const RegisterState()) {
    on<RegisterEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future<void> mapEventToState(RegisterEvent event, Emitter<RegisterState> emit) async {
    if (event is NameChanged) {
      emit(state.copyWith(
        name: event.name,
        isNameValid: event.name.isNotEmpty,
        formStatus: FormEditing(),
      ));
    } else if (event is EmailChanged) {
      emit(state.copyWith(
        email: event.email,
        formStatus: FormEditing(),
      ));
    } else if (event is PhoneChanged) {
      emit(state.copyWith(
        phoneNumber: event.phoneNumber,
        formStatus: FormEditing(),
      ));
    } else if (event is DobChanged) {
      emit(state.copyWith(
        dob: event.dob,
        formStatus: FormEditing(),
      ));
    }
    else if (event is StreetChange) {
      emit(state.copyWith(
        street: event.street,
        isStreetValid: event.street.isNotEmpty,
        formStatus: FormEditing(),
      ));
    }
    else if (event is StateChange) {
      emit(state.copyWith(
        state: event.state,
        isStateValid: event.state.isNotEmpty,
        formStatus: FormEditing(),
      ));
    }
    else if (event is CountryChanged) {
      emit(state.copyWith(
        country: event.country,
        isCountryValid: event.country.isNotEmpty,
        formStatus: FormEditing(),
      ));
    }

    else if (event is GenderChanged) {
      emit(state.copyWith(
        gender: event.gender,
        formStatus: FormEditing(),
      ));
    } else if (event is AboutChanged) {
      emit(state.copyWith(
        about: event.about,
        formStatus: FormEditing(),
      ));
    } else if (event is PasswordChanged) {
      emit(state.copyWith(
        password: event.password,
        isConfirmPasswordValid: event.password == state.confirmPassword,
        formStatus: FormEditing(),
      ));
    } else if (event is ConfirmPasswordChanged) {
      emit(state.copyWith(
        confirmPassword: event.confirmPassword,
       formStatus: FormEditing(),
      ));
    } else if (event is ConditionChanged) {
      emit(state.copyWith(
        termsAccepted: event.accepted,
     formStatus: FormEditing(),
      ));
    } else if (event is RegisterSubmit){
      Future.delayed(Duration(seconds: 5));
      emit(state.copyWith(
        isNameValid: state.name.isNotEmpty,
        isEmailValid: RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(state.email),
        isPhoneValid: state.phoneNumber.length == 10 && RegExp(r'^\d{10}$').hasMatch(state.phoneNumber),
        isDobValid: state.dob.isNotEmpty,
        isGenderValid: state.gender.isNotEmpty,
        isAboutValid: state.about.isNotEmpty,
        isPasswordValid: state.password.length >= 6,
        isConfirmPasswordValid: state.password == state.confirmPassword,
        isTermsAccepted: state.termsAccepted == 'true',
        formStatus: FormLoading(),
      ));
      Future.delayed(Duration(seconds: 5));
      if (state.isValid) {
        final address = Address(
          street: state.street,
          state: state.state, // renamed
          country: state.country,
        );

        final phone = int.tryParse(state.phoneNumber) ?? 0;
        final dob = DateTime.tryParse(state.dob) ?? DateTime(2000);

        final userData = RegisterModel(
          name: state.name,
          email: state.email,
          phoneNumber: phone,
          dob: dob,
          address: address,
          gender: state.gender,
          about: state.about,
          password: state.password,
          condition: true,
        );

        final repo = RegisterRepository();
        final response = await repo.storeData(userData);
        emit(state.copyWith(formStatus: FormSuccess("Registration Successful")));
      } else {
        emit(state.copyWith(formStatus: FormFailed("Please correct the errors")));
      }
    }
  }
}
