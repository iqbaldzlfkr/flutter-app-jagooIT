import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'input_validation_state.dart';

class InputValidationCubit extends Cubit<InputValidationState> {
  InputValidationCubit() : super(InputValidationInitial());
  void signIn({
    required String email,
    required String name,
  }) async {
    try {
      if (name.isEmpty) {
        emit(InputValidationNameFailed());
      } else {
        emit(InputValidationNameSuccess());
      }

      if (email.isEmpty) {
        emit(InputValidationEmailFailed());
      } else {
        emit(InputValidationEmailSuccess());
      }

      if (email.isNotEmpty && name.isNotEmpty) {
        emit(InputValidationSuccess());
      }
    } catch (e) {
      emit(InputValidationFailed());
    }
  }
}
