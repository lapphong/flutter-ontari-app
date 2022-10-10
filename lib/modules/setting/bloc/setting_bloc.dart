import 'dart:async';

import 'package:ontari_app/resource/user_data_bloc.dart';
import 'package:ontari_app/resource/user_repo.dart';

import '../../../blocs/app_event_bloc.dart';
import '../../../models/user.dart';
import '../repos/user_detail_repo.dart';

// class AppUserBloc extends BlocBase {
//   final _userController = BehaviorSubject<User>();
//   Stream<User> get userStream => _userController.stream;
//   User get userDetail => _userController.stream.value;

//   Future<void> getUserDeTail() async {
//     try {
//       final res = await UserDetailRepo().getUserDetailRepos();
//       if (res != null) {
//         _userController.sink.add(res);
//       }
//     } catch (e) {
//       _userController.sink.addError('Cannot fetch user !');
//     }
//   }

//   Future<bool> updateUserDetail(
//     String firstName,
//     String lastName,
//     String email,
//   ) async {
//     try {
//       final data = {
//         "first_name": firstName,
//         "last_name": lastName,
//         "email": email,
//       };

//       final res = await UserDetailRepo().putUserDetailRepos(data);
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   void dispose() {
//     _userController.close();
//   }
// }

class SettingBloc extends UserDataBehaviorBloc<User> {
  Stream<User?> get userStream => dataStream;
  final UserDetailRepo _repo;

  late final StreamSubscription<BlocEvent> _onUpdateProfileUserSub;
  // late final StreamSubscription<BlocEvent> _onChangeLanguageSub;
  // late final StreamSubscription<BlocEvent> _onChangeThemeSub;

  SettingBloc() : _repo = UserDetailRepo() {
    _onUpdateProfileUserSub = AppEventBloc().listenEvent(
      eventName: EventName.updateProfileUser,
      handler: _onUpdateProfileUser,
    );
  }

  void _onUpdateProfileUser(BlocEvent evt) {
    print('_onUpdateProfileUser');
    refresh();
  }

  Future<void> getUserDeTail() async {
    return getData();
  }

  @override
  UserRepo get dataRepo => _repo;

  @override
  void dispose() {
    _onUpdateProfileUserSub.cancel();
  }
}
