import 'package:firebase_auth/firebase_auth.dart';

abstract class PhoneAuthState{}
class PhoneAuthInitialState extends PhoneAuthState{}
class OtpSentState extends PhoneAuthState{}
class OtpVerifiedState extends PhoneAuthState{}
class LoggedInState extends PhoneAuthState{
  final User firebaseUser;
  LoggedInState(this.firebaseUser);
}
class LoggedOutState extends PhoneAuthState{}
class LoadingState extends PhoneAuthState{}
class ErrorState extends PhoneAuthState{
  String error;
  ErrorState(this.error);
}