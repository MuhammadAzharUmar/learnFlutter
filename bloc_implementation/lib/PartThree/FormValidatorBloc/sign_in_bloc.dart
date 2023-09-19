import 'package:bloc_implementation/PartThree/FormValidatorBloc/sign_in_event.dart';
import 'package:bloc_implementation/PartThree/FormValidatorBloc/sign_in_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<TextInputValidationEvent>((event, emit) {
      if (EmailValidator.validate(event.email) == false) {
        emit(SignInErrorState("Please Enter Valid Email Address"));
      } else if (event.password.length < 8) {
        emit(SignInErrorState("Password should be at least 8 characters"));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmittionEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
