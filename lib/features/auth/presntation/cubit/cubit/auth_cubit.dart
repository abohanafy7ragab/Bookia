import 'package:bloc/bloc.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  login({required String email, required String password}) async {
    emit(loginLaodingState());
    final response = await AuthRepo.login(email: email, password: password);
    if (response) {
      emit(loginSuccessState());
    } else {
      emit(loginErrorState());  
    }
  }
}
