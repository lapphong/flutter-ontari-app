import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../assets/assets_path.dart';
import '../../themes/app_color.dart';
import '../../themes/text_style.dart';
import '../stateless/common_avatar.dart';

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({
    Key? key,
    this.emailFocusNode,
    this.emailController,
    this.onChanged,
    this.onEditingComplete,
  }) : super(key: key);

  final FocusNode? emailFocusNode;
  final TextEditingController? emailController;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;

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
              prefixIcon: const Align(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: CustomAvatar(
                  width: 15,
                  height: 12,
                  assetName: AssetPath.iconEmail,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({
    Key? key,
    this.suffixIcon,
    this.passwordController,
    this.passwordFocusNode,
    this.onChanged,
    this.onEditingComplete,
    this.obscureText = true,
  }) : super(key: key);

  final Widget? suffixIcon;
  final TextEditingController? passwordController;
  final FocusNode? passwordFocusNode;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final bool obscureText;

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
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
            onChanged: widget.onChanged,
            textInputAction: TextInputAction.done,
            onEditingComplete: widget.onEditingComplete,
            controller: widget.passwordController,
            focusNode: widget.passwordFocusNode,
            obscureText: widget.obscureText,
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
              prefixIcon: const Align(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: CustomAvatar(
                  width: 15,
                  height: 16,
                  assetName: AssetPath.iconLock,
                ),
              ),
              suffixIcon: widget.suffixIcon,
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
    this.keyboardType,
    required this.textController,
    this.onChanged,
  }) : super(key: key);
  final Widget? childPrefixIcon;
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController textController;
  final Function(String)? onChanged;

  @override
  State<TextFieldSearchBar> createState() => _TextFieldSearchBarState();
}

class _TextFieldSearchBarState extends State<TextFieldSearchBar> {
  @override
  void initState() {
    super.initState();
    widget.textController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        controller: widget.textController,
        textInputAction: TextInputAction.done,
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
          hintText: widget.hintText,
          hintStyle: TxtStyle.hintText,
          prefixIcon: Align(
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: widget.childPrefixIcon,
          ),
          suffixIcon: widget.textController.text.isNotEmpty
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
                  onPressed: () => widget.textController.clear(),
                )
              : const Text(''),
        ),
      ),
    );
  }
}

class InputCode extends StatelessWidget {
  const InputCode({
    Key? key,
    this.textController,
  }) : super(key: key);
  final TextEditingController? textController;

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
        controller: textController,
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
