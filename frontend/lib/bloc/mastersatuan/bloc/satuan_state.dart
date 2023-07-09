part of 'satuan_bloc.dart';

@immutable
abstract class FormState {}

class FormInitial extends FormState {}

class FormSuccessState extends FormState {
  final List<String> printdata;

  FormSuccessState(this.printdata);
}

class FormErrorState extends FormState {
  final String errorMessage;

  FormErrorState(this.errorMessage);
}
