import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/modules/authentication/pages/sign_up_page.dart';
import 'package:ontari_app/widgets/stateless/common_avatar.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:ontari_app/widgets/stateful/common_textfield.dart';

import '../../../../utils/showSnackBar.dart';
import '../../../assets/assets_path.dart';
import '../../../blocs/app_state_bloc.dart';
import '../../../providers/bloc_provider.dart';
import '../bloc/authentication_bloc.dart';
import '../enum/login_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  //----------------------------------------------------------------------------

  AppStateBloc? get appStateBloc => BlocProvider.of<AppStateBloc>(context);
  AuthenticationBloc? get authenticationBloc =>
      BlocProvider.of<AuthenticationBloc>(context);

  //----------------------------------------------------------------------------
  Future<void> _signInWithGmail() async {
    try {
      final loginState = await authenticationBloc!.signInWithGmail();
      switch (loginState) {
        case LoginState.success:
          return _changeAppState();
        case LoginState.newUser:
          // handle flow newUser
          break;
        default:
          break;
      }
    } on PlatformException catch (e) {
      _handleErrorPlatformException(e);
    } catch (e) {
      showSnackBar(
        context,
        'Something went wrong!!!',
        Image.asset(AssetPath.iconClose, color: DarkTheme.red),
      );
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      final loginState = await authenticationBloc!.signInWithFacebook();
      switch (loginState) {
        case LoginState.success:
          return _changeAppState();
        case LoginState.newUser:
          // handle flow newUser
          break;
        default:
          break;
      }
    } on PlatformException catch (e) {
      _handleErrorPlatformException(e);
    } catch (e) {
      showSnackBar(
        context,
        'Something went wrong!!!',
        Image.asset(AssetPath.iconClose, color: DarkTheme.red),
      );
    }
  }

  Future<void> _signInWithEmailPassword(String email, String password) async {
    try {
      final loginState = await authenticationBloc!.signInWithEmailAndPassword(
        email,
        password,
      );
      switch (loginState) {
        case LoginState.success:
          return _changeAppState();
        case LoginState.newUser:
          // handle flow newUser
          break;
        default:
          break;
      }
    } on PlatformException catch (e) {
      _handleErrorPlatformException(e);
    } catch (e) {
      showSnackBar(
        context,
        'Something went wrong!!!',
        Image.asset(AssetPath.iconClose, color: DarkTheme.red),
      );
    }
  }

  void _changeAppState() {
    snackBarSuccess();
    appStateBloc!.changeAppState(AppState.authorized);
  }

  void _handleErrorPlatformException(PlatformException e) {
    if (e.code != 'ERROR_ABORTED_BY_USER') {
      snackBarError(e);
    }
  }
  //----------------------------------------------------------------------------

  Widget buildTextFieldEmail() {
    return StreamBuilder(
      stream: authenticationBloc!.email,
      builder: (context, snapshot) {
        return TextFieldEmail(
          onChanged: (value) => authenticationBloc!.updateEmail(value),
          emailController: _emailController,
          emailFocusNode: _emailFocusNode,
        );
      },
    );
  }

  bool _onChanged = false;
  bool _isObscure = true;
  Widget buildTextFieldPassword() {
    return StreamBuilder(
      stream: authenticationBloc!.password,
      builder: (context, snapshot) {
        return TextFieldPassword(
          passwordController: _passwordController,
          passwordFocusNode: _passwordFocusNode,
          onChanged: (value) {
            authenticationBloc!.updatePassword(value);
            _onChanged = true;
            setState(() {});
          },
          obscureText: _isObscure,
          suffixIcon: _passwordController.text.isEmpty
              ? Container(width: 0)
              : Align(
                  widthFactor: 0.5,
                  heightFactor: 0.5,
                  child: _onChanged
                      ? CustomAvatar(
                          width: 20,
                          height: 15,
                          assetName: _isObscure
                              ? AssetPath.iconEye
                              : AssetPath.iconHideEye,
                          onTap: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )
                      : const Text(''),
                ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Text('Ontari.', style: TxtStyle.titleSplash),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: buildTextFieldEmail(),
              ),
              buildTextFieldPassword(),
              buildForgotPassword(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ClassicButton(
                  onTap: () => _signInWithEmailPassword(
                    _emailController.text,
                    _passwordController.text,
                  ),
                  width: size.width,
                  radius: 12,
                  widthRadius: 0,
                  colorRadius: DarkTheme.primaryBlue600,
                  height: 52,
                  color: DarkTheme.primaryBlue600,
                  child: const Center(child: Text('Sign in')),
                ),
              ),
              const Text(
                'Or continue with social account',
                style: TxtStyle.headline5MediumWhite,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: ClassicButton(
                  onTap: _signInWithGmail,
                  width: size.width,
                  widthRadius: 0,
                  radius: 12,
                  height: 52,
                  color: DarkTheme.primaryBlueButton900,
                  colorRadius: DarkTheme.primaryBlueButton900,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetPath.iconGoogle),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text('Sign In with Google'),
                      ),
                    ],
                  ),
                ),
              ),
              ClassicButton(
                onTap: _signInWithFacebook,
                width: size.width,
                widthRadius: 0,
                radius: 12,
                height: 52,
                color: DarkTheme.primaryBlueButton900,
                colorRadius: DarkTheme.primaryBlueButton900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetPath.iconFacebook),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Sign In with Facebook'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ClassicButton(
                onTap: () {},
                width: size.width,
                widthRadius: 0,
                radius: 12,
                height: 52,
                color: DarkTheme.primaryBlueButton900,
                colorRadius: DarkTheme.primaryBlueButton900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.phone, color: DarkTheme.green),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Sign In with Phone number'),
                    ),
                  ],
                ),
              ),
              buildGoToSignUpPage(context),
            ],
          ),
        ),
      ),
    );
  }

  Align buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text('Forgot password?', style: TxtStyle.headline4blue),
      ),
    );
  }

  Padding buildGoToSignUpPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Don\'t have an account? ', style: TxtStyle.term),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ),
              );
            },
            child: const Text('Create Here', style: TxtStyle.create),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void snackBarError(PlatformException e) {
    return showSnackBar(
      context,
      'Sign in cancelled : ${e.message}',
      Image.asset(AssetPath.iconClose, color: DarkTheme.red),
    );
  }

  void snackBarSuccess() {
    return showSnackBar(
      context,
      "Sign in Successfully",
      Image.asset(AssetPath.iconChecked, color: DarkTheme.green),
    );
  }
}
