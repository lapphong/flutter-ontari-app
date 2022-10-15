import 'package:ontari_app/providers/bloc_provider.dart';
import 'package:ontari_app/resource/theme_manager.dart';
import 'package:rxdart/rxdart.dart';

import '../../../blocs/app_event_bloc.dart';
import '../../../providers/log_provider.dart';

class ChangeThemeBloc implements BlocBase {
  // true: darkMode - false: lightMode
  final _appMode = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get appMode => _appMode.stream;
  bool get appModeValue => _appMode.stream.value;
  bool get initState => true;
  LogProvider get logger => const LogProvider('⚡️ AppModeBloc');
  ThemeManager get themeManager => ThemeManager();

  ChangeThemeBloc() {
    launchApp();
  }

  Future<void> launchApp() async {
    final themeMode = await themeManager.getTheme();
    logger.log('themeMode $themeMode');

    switch (themeMode) {
      case false:
        await changeAppMode(false);
        break;
      default:
        await changeAppMode(true);
    }
  }

  Future<void> changeAppMode(bool mode) async {
    await themeManager.saveTheme(mode);
    logger.log('changeAppMode $mode');
    _appMode.sink.add(mode);
  }

  @override
  void dispose() {
    _appMode.close();
  }
}