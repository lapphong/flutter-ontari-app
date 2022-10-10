import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:ontari_app/widgets/stateful/common_textfield.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../../utils/showSnackBar.dart';
import '../../../assets/assets_path.dart';

class VerifyYourPage extends StatefulWidget {
  const VerifyYourPage({Key? key}) : super(key: key);

  @override
  State<VerifyYourPage> createState() => _VerifyYourPageState();
}

class _VerifyYourPageState extends State<VerifyYourPage> {
  final OtpFieldController _controller = OtpFieldController();
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  TextFieldSearchBar buildTextFieldPhoneNumber() {
    return TextFieldSearchBar(
      textController: _textController,
      keyboardType: TextInputType.number,
      hintText: "Enter phone number ...",
      childPrefixIcon: const Icon(
        Icons.phone_iphone,
        color: DarkTheme.greyScale300,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 140, bottom: 6),
                  child: Text(
                    'Phone Verification',
                    style: TxtStyle.headline2BoldWhite,
                  ),
                ),
                const Text(
                  'We have sent code to your number\n(+62) 897 6464 0808',
                  style: TxtStyle.bodySmallMediumGrey,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 240,
                      child: buildTextFieldPhoneNumber(),
                    ),
                    const ClassicButton(
                      widthRadius: 2.0,
                      width: 70,
                      height: 40,
                      radius: 10,
                      color: DarkTheme.greyScale800,
                      colorRadius: DarkTheme.primaryBlue700,
                      child: Center(
                        child: Text(
                          'Send',
                          style: TxtStyle.headline4White2,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                OTPTextField(
                  onCompleted: (pin) {},
                  controller: _controller,
                  length: 6,
                  width: 360,
                  fieldWidth: 48,
                  otpFieldStyle: OtpFieldStyle(
                    backgroundColor: DarkTheme.greyScale800,
                    borderColor: DarkTheme.primaryBlue600,
                  ),
                  style: TxtStyle.headline4White,
                  fieldStyle: FieldStyle.box,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ClassicButton(
                        onTap: () {},
                        widthRadius: 2.0,
                        width: 84,
                        height: 40,
                        radius: 10,
                        color: DarkTheme.primaryBlueButton900,
                        colorRadius: DarkTheme.primaryBlue900,
                        child: const Center(
                            child: Text(
                          '111111',
                          style: TxtStyle.headline4White2,
                        )),
                      ),
                    ),
                    const Text(
                      'Use code from your phone',
                      style: TxtStyle.headline5MediumWhite,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void snackBarEmpty() {
    return showSnackBar(
      context,
      "Please enter the phone number",
      Image.asset(
        AssetPath.iconClose,
        color: DarkTheme.red,
      ),
    );
  }

  void snackBarSuccess() {
    return showSnackBar(
      context,
      "Sign in with phone number Successfully",
      Image.asset(
        AssetPath.iconChecked,
        color: DarkTheme.green,
      ),
    );
  }
}
