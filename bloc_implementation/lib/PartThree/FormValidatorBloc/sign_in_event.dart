abstract class SignInEvent {}

class TextInputValidationEvent extends SignInEvent {
  //here we will provide email and password from ui to check if email is valid or password length and strength is ok
  String email;
  String password;
  TextInputValidationEvent(this.email, this.password);
}

class SignInSubmittionEvent extends SignInEvent {
  //here we provide email and password from ui to check if these or null or not so we can proceed with submission
  String email;
  String password;
  SignInSubmittionEvent(this.email, this.password);
}
