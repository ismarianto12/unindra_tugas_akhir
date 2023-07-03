part of 'satuan_bloc.dart';

@immutable
abstract class FormEvent {}

class SubmitFormEvent extends FormEvent {
  final String kode;
  final String namaMaster;

  SubmitFormEvent(this.kode, this.namaMaster);
}
