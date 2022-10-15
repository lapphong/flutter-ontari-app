// import 'package:ontari_app/providers/bloc_provider.dart';
// import 'package:ontari_app/resource/theme_manager.dart';
// import 'package:rxdart/rxdart.dart';

// import '../../../providers/log_provider.dart';

// enum ThemeMode { darkMode, lightMode }

// class ChangeThemeBloc implements BlocBase {
//   final _appMode = BehaviorSubject<ThemeMode>.seeded(ThemeMode.darkMode);
//   Stream<ThemeMode> get appMode => _appMode.stream;
//   ThemeMode get appModeValue => _appMode.stream.value;
//   ThemeMode get initMode => ThemeMode.darkMode;
//   LogProvider get logger => const LogProvider('⚡️ AppModeBloc');
//   ThemeManager get themeManager => ThemeManager();

//   ChangeThemeBloc() {
//     launchApp();
//   }

//   Future<void> launchApp() async {
//     final themeMode = await themeManager.getTheme();
//     logger.log('themeMode $themeMode');

//     switch (themeMode) {
//       case 1:
//         await changeAppMode(ThemeMode.lightMode);
//         break;
//       default:
//         await changeAppMode(ThemeMode.darkMode);
//     }
//   }

//   Future<void> changeAppMode(ThemeMode mode) async {
//     await themeManager.saveTheme(mode.index);
//     logger.log('changeAppMode $mode');
//     _appMode.sink.add(mode);
//   }

//   @override
//   void dispose() {
//     _appMode.close();
//   }
// }