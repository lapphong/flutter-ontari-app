import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ontari_app/constants/assets_path.dart';

import '../../config/themes/app_color.dart';
import '../../config/themes/text_style.dart';
import 'common_avatar.dart';

class TextFieldEmail extends StatelessWidget {
  TextFieldEmail({
    Key? key,
    this.emailFocusNode,
    this.emailController,
    this.childPrefixIcon,
    //this.errorText = '',
    this.onChanged,
    this.onEditingComplete,
  }) : super(key: key);

  final FocusNode? emailFocusNode;
  final TextEditingController? emailController;
  final Widget? childPrefixIcon;
  //final String errorText;
  Function(String)? onChanged;
  Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Email Address', style: TxtStyle.titleInput),
        const SizedBox(height: 10),
        SizedBox(
          height: 52,
          child: TextField(
            controller: emailController,
            focusNode: emailFocusNode,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              //errorText: errorText,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: DarkTheme.greyScale900,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: DarkTheme.greyScale800,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: DarkTheme.primaryBlue600,
                  width: 2,
                ),
              ),
              hintText: 'Enter your email address',
              hintStyle: TxtStyle.hintText,
              prefixIcon: Align(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: childPrefixIcon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TextFieldPassword extends StatefulWidget {
  TextFieldPassword({
    Key? key,
    this.assetPrefixIcon,
    this.passwordController,
    this.passwordFocusNode,
    this.onChanged,
    this.onEditingComplete,

  }) : super(key: key);

  final String? assetPrefixIcon;
  final TextEditingController? passwordController;
  final FocusNode? passwordFocusNode;
  Function(String)? onChanged;
  Function()? onEditingComplete;

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool? onChanged = true;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Password', style: TxtStyle.titleInput),
        const SizedBox(height: 16),
        SizedBox(
          height: 52,
          child: TextField(
            // onChanged: (value) {
            //   //widget.onChanged = value as Function(String?);
            //   onChanged = false;
            //   setState(() {});
            // },
            onChanged: widget.onChanged,
            textInputAction: TextInputAction.done,
            onEditingComplete: widget.onEditingComplete,
            controller: widget.passwordController,
            focusNode: widget.passwordFocusNode,
            obscureText: _isObscure,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: DarkTheme.greyScale900,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: DarkTheme.greyScale800,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: DarkTheme.primaryBlue600,
                  width: 2,
                ),
              ),
              hintText: 'Enter your password',
              hintStyle: TxtStyle.hintText,
              prefixIcon: Align(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: CustomAvatar(
                  width: 15,
                  height: 16,
                  assetName: widget.assetPrefixIcon!,
                ),
              ),
              suffixIcon: Align(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: !onChanged!
                    ? CustomAvatar(
                        width: 20,
                        height: 15,
                        assetName: _isObscure
                            ? AssetPath.iconEye
                            : AssetPath.iconHideEye,
                        onTap: () {
                          setState(() {
                            _isObscure ? _isObscure = false : _isObscure = true;
                          });
                        },
                      )
                    : const Text(''),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TextFieldSearchBar extends StatefulWidget {
  const TextFieldSearchBar({
    Key? key,
    this.childPrefixIcon,
    required this.hintText,
    //this.errorText = '',
    //this.emailController,
  }) : super(key: key);
  //final String errorText;
  final Widget? childPrefixIcon;
  final String hintText;
  //final TextEditingController? emailController;

  @override
  State<TextFieldSearchBar> createState() => _TextFieldSearchBarState();
}

class _TextFieldSearchBarState extends State<TextFieldSearchBar> {
  bool? _onChanged = true;
  final TextEditingController? emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: emailController,
        onChanged: (value) {
          _onChanged = false;
          setState(() {});
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          //errorText: widget.errorText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: DarkTheme.greyScale900,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: DarkTheme.greyScale800,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: DarkTheme.primaryBlue600,
              width: 2,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TxtStyle.hintText,
          prefixIcon: Align(
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: widget.childPrefixIcon,
          ),
          suffixIcon: !_onChanged!
              ? IconButton(
                  icon: const Align(
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: CustomAvatar(
                      width: 15,
                      height: 15,
                      assetName: AssetPath.iconClose,
                    ),
                  ),
                  onPressed: () {
                    emailController?.clear();
                    setState(() {
                      _onChanged = true;
                    });
                  },
                )
              : const Text(''),
        ),
      ),
    );
  }
}

class InputCode extends StatefulWidget {
  const InputCode({
    Key? key,
  }) : super(key: key);

  @override
  State<InputCode> createState() => _InputCodeState();
}

class _InputCodeState extends State<InputCode> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 55,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardAppearance: Brightness.dark,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TxtStyle.headline4White,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: DarkTheme.greyScale800,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: DarkTheme.greyScale800,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: DarkTheme.primaryBlue600,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
