import 'package:equatable/equatable.dart';
import 'package:form1/bloc/form_bloc/form_event.dart'; // Assuming FormStatus is here

class HomeState extends Equatable {
  final String selectedCountry;
  final int currentIndex;
  final FormStatus formStatus;

  const HomeState({
  this.selectedCountry = 'USA',
    this.currentIndex = 0,
    this.formStatus = const FormInitial(),
  });

  HomeState copyWith({
    String? selectedCountry,
    int? pageIndex,
    FormStatus? formStatus,
  }) {
    return HomeState(
      selectedCountry: selectedCountry ?? this.selectedCountry,
      currentIndex: pageIndex ?? this.currentIndex,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [selectedCountry, currentIndex, formStatus];
}
