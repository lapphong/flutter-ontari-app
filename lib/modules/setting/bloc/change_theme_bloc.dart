import 'package:ontari_app/providers/bloc_provider.dart';
import 'package:ontari_app/resource/theme_manager.dart';
import 'package:rxdart/rxdart.dart';

import '../../../providers/log_provider.dart';

class ChangeThemeBloc implements BlocBase {
  final _appMode = BehaviorSubject<bool>();
  Stream<bool> get appMode => _appMode.stream;
  bool get appModeValue => _appMode.stream.value;
  LogProvider get logger => const LogProvider('⚡️ AppModeBloc');
  ThemeManager get themeManager => ThemeManager();

  ChangeThemeBloc() {
    launchApp();
  }

  Future<void> launchApp() async {
    final themeMode = await themeManager.getTheme();
    _appMode.sink.add(themeMode);
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
