import 'package:ontari_app/models/user.dart';

import '../providers/api_provider.dart';

abstract class UserRepo<T> {
  final _apiProvider = ApiProvider();

  String get url;
  User? user;

  Future<User?> getUserDetailRepos() async {
    try {
      final response = await _apiProvider.get(url);

      if (response.statusCode != 200) {
        return null;
      }

      Map<String, dynamic> data = response.data['data'];
      return User.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> putUserDetailRepos(dynamic data) async {
    try {
      final response = await _apiProvider.put(url, data: data);

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  void refresh() {
    user = null;
  }
}
