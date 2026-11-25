import 'package:bloc/bloc.dart';
import 'package:bookia/core/networking/api_result.dart';
import 'package:bookia/features/forget_password/data/repo/forget_password_repo.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLaoding());
    try {
      final response = await ForgetPasswordRepo.sendEmail(email: email);
      if (response is Success) {
        emit(ForgetPasswordSuccuss());
      } else {
        emit(ForgetPasswordError());
      }
    } catch (e) {
      emit(ForgetPasswordError());
    }
  }
}
