part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
final class ForgetPasswordSuccuss extends ForgetPasswordState {}
final class ForgetPasswordError extends ForgetPasswordState {}
final class ForgetPasswordLaoding extends ForgetPasswordState {}
