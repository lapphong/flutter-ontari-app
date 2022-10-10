import '../../../blocs/app_event_bloc.dart';
import '../repos/user_detail_repo.dart';

class UpdateProfileBloc {
  Future<bool> updateUserDetail(
    String firstName,
    String lastName,
    String email,
  ) async {
    try {
      final data = {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
      };

      final res = await UserDetailRepo().putUserDetailRepos(data);
      if (res) {
        AppEventBloc().emitEvent(const BlocEvent(EventName.updateProfileUser));
      }

      return res;
    } catch (e) {
      rethrow;
    }
  }
}

