import 'package:equatable/equatable.dart';

abstract class FormStatus extends Equatable {
  const FormStatus();

  @override
  List<Object?> get props => [];
}

class FormInitial extends FormStatus {
  const FormInitial();
}

class FormEditing extends FormStatus {}

class FormLoading extends FormStatus {}

class FormSuccess extends FormStatus {
  final String message;

  const FormSuccess(this.message);  // Positional constructor

  @override
  List<Object?> get props => [message];
}

class FormFailed extends FormStatus {
  final String message;

  const FormFailed(this.message);  // Positional constructor

  @override
  List<Object?> get props => [message];
}
