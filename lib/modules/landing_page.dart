import 'package:flutter/material.dart';
import 'package:ontari_app/providers/bloc_provider.dart';
import 'package:ontari_app/routes/routes.dart';
import 'package:ontari_app/themes/app_color.dart';

import '../blocs/app_state_bloc.dart';
import 'authentication/bloc/authentication_bloc.dart';
import 'authentication/wrapper/service/app_auth_service.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final appStateBloc = AppStateBloc();
  late AuthenticationBloc _authenticationBloc;
  static final GlobalKey<State> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(AppAuthService());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: appStateBloc,
      child: StreamBuilder<AppState>(
        stream: appStateBloc.appState,
        initialData: appStateBloc.initState,
        builder: (context, snapshot) {
          if (snapshot.data == AppState.loading) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                backgroundColor: DarkTheme.greyScale900,
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          }
          if (snapshot.data == AppState.unAuthorized) {
            return BlocProvider(
              bloc: _authenticationBloc,
              child: MaterialApp(
                theme: ThemeData(
                  scaffoldBackgroundColor: DarkTheme.greyScale900,
                  fontFamily: 'manrope',
                  textTheme: Theme.of(context).textTheme.apply(
                      bodyColor: DarkTheme.white,
                      displayColor: DarkTheme.white),
                ),
                key: const ValueKey('UnAuthorized'),
                builder: _builder,
                onGenerateRoute: Routes.unAuthorizedRoute,
                debugShowCheckedModeBanner: false,
              ),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: Routes.authorizedRoute,
            theme: ThemeData(
              scaffoldBackgroundColor: DarkTheme.greyScale900,
              fontFamily: 'manrope',
              textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: DarkTheme.white, displayColor: DarkTheme.white),
            ),
            key: key,
            builder: _builder,
            navigatorKey: LandingPage.navigatorKey,
          );
        },
      ),
    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    final data = MediaQuery.of(context);
    return MediaQuery(
      data: data.copyWith(textScaleFactor: 1),
      child: child!,
    );
  }
}
