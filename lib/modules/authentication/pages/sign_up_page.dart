import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/widgets/stateless/common_avatar.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:ontari_app/widgets/stateful/common_textfield.dart';
import 'package:ontari_app/widgets/stateless/terms.dart';

import '../../../../utils/showSnackBar.dart';
import '../../../assets/assets_path.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  TextFieldEmail buildTextFieldEmail() {
    return TextFieldEmail(
      emailController: _emailController,
      emailFocusNode: _emailFocusNode,
    );
  }

  bool _onChanged = false;
  bool _isObscure = true;
  TextFieldPassword buildTextFieldPassword() {
    return TextFieldPassword(
      passwordController: _passwordController,
      passwordFocusNode: _passwordFocusNode,
      onChanged: (value) {
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
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Text('Sign Up', style: TxtStyle.titleSplash),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: buildTextFieldEmail(),
              ),
              buildTextFieldPassword(),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 28),
                child: Terms(size: size),
              ),
              ClassicButton(
                //onTap: () => model.canSubmit ? _submit() : null,
                width: size.width,
                radius: 12,
                widthRadius: 0,
                colorRadius: DarkTheme.primaryBlue600,
                height: 52,
                color: DarkTheme.primaryBlue600,
                child: const Center(child: Text('Sign up')),
              ),
              const SizedBox(height: 24),
              const Text(
                'Or continue with social account',
                style: TxtStyle.headline5MediumWhite,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClassicButton(
                    //onTap: () => print('Size: ${size}'),
                    width: 151,
                    widthRadius: 0,
                    radius: 12,
                    height: 52,
                    color: DarkTheme.primaryBlueButton900,
                    colorRadius: DarkTheme.primaryBlueButton900,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetPath.iconGoogle,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('Google'),
                        ),
                      ],
                    ),
                  ),
                  ClassicButton(
                    //onTap: () => print('Size: ${size}'),
                    width: 151,
                    widthRadius: 0,
                    radius: 12,
                    height: 52,
                    color: DarkTheme.primaryBlueButton900,
                    colorRadius: DarkTheme.primaryBlueButton900,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetPath.iconFacebook,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('Facebook'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? ', style: TxtStyle.term),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Sign in', style: TxtStyle.create),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void snackBarSuccess() {
    return showSnackBar(
      context,
      "Sign up Successfully",
      Image.asset(AssetPath.iconChecked, color: DarkTheme.green),
    );
  }
}
