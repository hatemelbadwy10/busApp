import 'package:busapp/features/auth/presentation/sign_in_view/manger/sign_in_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_cubit_event.dart';

class SignInCubitBloc extends Bloc<SignInCubitEvent, SignInCubitState> {
  SignInCubitBloc() : super(SignInCubitInitial());
  bool _isObscured = true;
  void togglePasswordVisibility() {
    _isObscured = !_isObscured;
    emit(ObsucureTextChanged(_isObscured));
  }
}
