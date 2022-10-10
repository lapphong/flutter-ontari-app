import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ontari_app/themes/app_color.dart';

import 'routes/route_name.dart';
import 'routes/routes.dart' as router;
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: DarkTheme.greyScale900,
      statusBarBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: DarkTheme.greyScale50,
        scaffoldBackgroundColor: DarkTheme.greyScale50,
        fontFamily: 'manrope',
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: DarkTheme.white, displayColor: DarkTheme.white),
      ),
      initialRoute: RouteName.listPage,
      onGenerateRoute: router.Routes.generateRoute,
    );
  }
}
