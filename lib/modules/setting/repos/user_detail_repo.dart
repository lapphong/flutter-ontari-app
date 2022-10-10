import 'package:ontari_app/models/user.dart';

import '../../../resource/user_repo.dart';

// class UserDetailRepo {
//   final apiProvider = ApiProvider();

//   Future<User?> getUserDetailRepos() async {
//     try {
//       final response = await apiProvider.get("/profile");

//       if (response.statusCode != 200) {
//         return null;
//       }

//       Map<String, dynamic> data = response.data['data'];
//       return User.fromJson(data);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<bool> putUserDetailRepos(dynamic data) async {
//     try {
//       final response = await apiProvider.put("/profile", data: data);

//       return response.statusCode == 200;
//     } catch (e) {
//       return false;
//     }
//   }
// }

class UserDetailRepo with UserRepo<User> {
  @override
  String get url => '/profile';
}
