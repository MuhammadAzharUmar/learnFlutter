abstract class SignInState{}
class SignInInitialState extends SignInState{}//initial state 
class SignInValidState extends SignInState{}//when email and password found correct
class SignInLoadingState extends SignInState{}//when submission event occure show loading
class SignInErrorState extends SignInState{
  String errorMessage;
  SignInErrorState(this.errorMessage);
}//show error on screen