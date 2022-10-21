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
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final appStateBloc = AppStateBloc();
  late AuthenticationBloc _authenticationBloc;
  static final GlobalKey<State> _key = GlobalKey();

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
            return const MaterialAppData(routes: Routes.loadingRoute);
          }
          if (snapshot.data == AppState.unAuthorized) {
            return BlocProvider(
              bloc: _authenticationBloc,
              child: MaterialAppData(
                routes: Routes.unAuthorizedRoute,
                keyState: const ValueKey('UnAuthorized'),
                builder: _builder,
              ),
            );
          }
          return MaterialAppData(
            routes: Routes.authorizedRoute,
            keyState: _key,
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

class MaterialAppData extends StatelessWidget {
  const MaterialAppData({
    Key? key,
    required this.routes,
    this.keyState,
    this.builder,
    this.navigatorKey,
  }) : super(key: key);

  final Route<dynamic>? Function(RouteSettings) routes;
  final Key? keyState;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget Function(BuildContext, Widget?)? builder;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routes,
      initialRoute: '/',
      theme: ThemeData(
        scaffoldBackgroundColor: DarkTheme.greyScale900,
        fontFamily: 'manrope',
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: DarkTheme.white, displayColor: DarkTheme.white),
      ),
      key: keyState,
      builder: builder,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: LandingPage.scaffoldKey,
    );
  }
}
