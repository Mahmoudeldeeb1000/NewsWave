import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_wave/features/sign_up/presentetion/controller/regester_states.dart';

class RegesterCubit extends Cubit<RegesterStates> {
  RegesterCubit() : super(RegesterInitialStates());
  SignUpWithFireBase(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    emit(RegesterLoadingStates());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      emit(RegesterSuccessStates());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegesterFailureStates(errorMessage: "weak password"));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("The password provided is too weak.")));
      } else if (e.code == 'email-already-in-use') {
        emit(RegesterFailureStates(errorMessage: "email is already used"));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("The account already exists for that email.")));
      } else {
        emit(RegesterFailureStates(errorMessage: "Error Auth : ${e.message}"));
      }
    } catch (e) {
      emit(RegesterFailureStates(
          errorMessage: "Oops An Eccurred error ${e.toString()}"));
      print(e.toString());
    }
  }
}
