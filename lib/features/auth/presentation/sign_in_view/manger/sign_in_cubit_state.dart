// sign_in_cubit_bloc.dart
import 'package:meta/meta.dart';


@immutable
sealed class SignInCubitState {}

final class SignInCubitInitial extends SignInCubitState {}

final class ObsucureTextChanged extends SignInCubitState {
  final bool isObscured;

  ObsucureTextChanged(this.isObscured);
}
