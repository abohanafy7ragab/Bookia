import 'package:bloc/bloc.dart';
import 'package:bookia/features/profile/data/models/profile_response.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  getProfile() async {
    emit(GetProfileLaoding());
    final response = await ProfileRepo.profileData();
    if (response is ProfileResponse) {
      emit(GetProfileSuccess(profile: response));
    } else {
      emit(GetProfileError());
    }
  }
}
