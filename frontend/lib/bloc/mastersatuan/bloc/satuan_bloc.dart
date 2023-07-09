import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'satuan_event.dart';
part 'satuan_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(FormInitial());

  @override
  Stream<FormState> mapEventToState(
    FormEvent event,
  ) async* {
    if (event is SubmitFormEvent) {
      if (_validateInputs(event.kode, event.namaMaster)) {
        yield FormSuccessState([event.kode, event.namaMaster]);
      } else {
        yield FormErrorState('Form validation failed.');
      }
    }
  }

  bool _validateInputs(String kode, String namaMaster) {
    // Implement your validation logic here
    return true; // Change this to your actual validation logic
  }
}
