part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class loginLaodingState extends AuthState {}

final class loginSuccessState extends AuthState {}

final class loginErrorState extends AuthState {
  final String message;
  loginErrorState(this.message);
}

final class RegisterLaodingState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class RegisterErrorState extends AuthState {
  final String message;
  RegisterErrorState(this.message);
}
