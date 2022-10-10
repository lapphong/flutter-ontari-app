import 'package:ontari_app/utils/prefs_key.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/bloc_provider.dart';
import '../providers/log_provider.dart';

enum AppState { loading, unAuthorized, authorized }

class AppStateBloc implements BlocBase {
  // initialize the default value for the screen is loading
  final _appState = BehaviorSubject<AppState>.seeded(AppState.loading);
  // stream
  Stream<AppState> get appState => _appState.stream;
  // get value in stream
  AppState get appStateValue => _appState.stream.value;
  // get default initialization
  AppState get initState => AppState.loading;
  // get log
  LogProvider get logger => const LogProvider('⚡️ AppStateBloc');

  AppStateBloc() {
    launchApp();
  }

  Future<void> launchApp() async {
    // get value in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    // that returns int , does not return 0
    final authorLevel = prefs.getInt(PrefsKey.authorLevel) ?? 0;
    logger.log('authorLevel $authorLevel');

    switch (authorLevel) {
      case 2:
        await changeAppState(AppState.authorized);
        break;
      default:
        await changeAppState(AppState.unAuthorized);
    }
  }

  Future<void> changeAppState(AppState state) async {
    final prefs = await SharedPreferences.getInstance();
    //set value in SharedPreferences
    await prefs.setInt(PrefsKey.authorLevel, state.index);
    logger.log('changeAppState $state');
    // add to stream
    _appState.sink.add(state);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    // delete value in SharedPreferences
    await prefs.clear();
    // set app state UnAuthorized
    await changeAppState(AppState.unAuthorized);
  }

  @override
  void dispose() {
    _appState.close();
  }
}
