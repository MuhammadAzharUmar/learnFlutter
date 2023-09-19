import 'package:bloc_implementation/PartFour/Cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthInitialState()) {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      emit(LoggedInState(currentUser));
    } else {
      emit(LoggedOutState());
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _verficationId;
  void sendOtp(String phoneNumber) async {
    emit(LoadingState());
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (String verificationId, int? forceResendingToken) {
        _verficationId = verificationId;
        emit(OtpSentState());
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        signInWithPhone(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException error) {
        emit(ErrorState(error.message.toString()));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verficationId = verificationId;
      },
    );
  }

  void verifyOtp(String otp) async {
    emit(LoadingState());

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verficationId as String, smsCode: otp);
    signInWithPhone(credential);
  }

  void signInWithPhone(PhoneAuthCredential credential) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        emit(LoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void logout() async {
    await _auth.signOut();
    emit(LoggedOutState());
  }
}
