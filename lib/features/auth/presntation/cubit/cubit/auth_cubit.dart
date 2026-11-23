import 'package:bloc/bloc.dart';
import 'package:bookia/core/networking/api_result.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({required String email, required String password}) async {
    emit(loginLaodingState());
    final response = await AuthRepo.login(email: email, password: password);
    if (response is Success) {
      emit(loginSuccessState());
    } else if (response is Error) {
      emit(loginErrorState(response.message));
    }
  }

  void register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(RegisterLaodingState());
    final response = await AuthRepo.register(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
    if (response is Success) {
      emit(RegisterSuccessState());
    } else {
      emit(RegisterErrorState("message"));
    }
  }
}
