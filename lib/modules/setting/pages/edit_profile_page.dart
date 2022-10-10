import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/modules/setting/widgets/title_option_setting.dart';
import 'package:ontari_app/modules/setting/widgets/title_setting.dart';
import 'package:ontari_app/widgets/stateless/common_avatar.dart';
import 'package:ontari_app/widgets/stateless/common_bodyitem.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:ontari_app/widgets/stateful/common_textfield.dart';

import '../../../assets/assets_path.dart';
import '../../../models/user.dart';
import '../../../providers/bloc_provider.dart';
import '../bloc/setting_bloc.dart';
import '../bloc/update_profile_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  User get user => widget.user!;
  SettingBloc? get _bloc => BlocProvider.of<SettingBloc>(context);
  final _updateProfileBloc = UpdateProfileBloc();

  buildTextFieldFirstName(String displayFirstName) {
    _firstController.text = displayFirstName;
    _firstController.selection =
        TextSelection.collapsed(offset: _firstController.text.length);
    return buildTextFieldString(
      'First Name',
      'Enter your First Name',
      AssetPath.iconUser,
      _firstController,
    );
  }

  buildTextFieldLastName(String displayLastName) {
    _lastController.text = displayLastName;
    _lastController.selection =
        TextSelection.collapsed(offset: _lastController.text.length);
    return buildTextFieldString(
      'Last Name',
      'Enter your Last Name',
      AssetPath.iconUser,
      _lastController,
    );
  }

  buildTextFieldUserName(String displayUserName) {
    _userController.text = displayUserName;
    _userController.selection =
        TextSelection.collapsed(offset: _userController.text.length);
    return buildTextFieldString(
      'Username',
      'Enter your Username',
      AssetPath.iconUser,
      _userController,
    );
  }

  TextFieldEmail buildTextFieldEmail(String displayEmail) {
    _emailController.text = displayEmail;
    _emailController.selection =
        TextSelection.collapsed(offset: _emailController.text.length);
    return TextFieldEmail(
      emailController: _emailController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _firstController.dispose();
    _lastController.dispose();
    _userController.dispose();
    _emailController.dispose();
  }

  void _saveUpdateUserDetail() async {
    try {
      final res = await _updateProfileBloc.updateUserDetail(
        _firstController.text,
        _lastController.text,
        _emailController.text,
      );

      if (res) {
        Navigator.pop(context);
        _bloc!.refresh();
        return;
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleSetting(title: 'Edit Profile'),
                    ClassicButton(
                      onTap: _saveUpdateUserDetail,
                      width: 60,
                      height: 32,
                      radius: 12,
                      widthRadius: 0,
                      colorRadius: DarkTheme.primaryBlue600,
                      color: DarkTheme.primaryBlue600,
                      child: const Center(child: Text('Save')),
                    ),
                  ],
                ),
              ),
              const TitleOptionSettings(
                title: 'EDIT AVATAR',
                height: 32,
                color: DarkTheme.primaryBlueButton,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: BodyItemNetwork(
                  assetName: user.imgUrl!,
                  height: 64,
                  widthImg: 64,
                  mid: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ClassicButton(
                          widthRadius: 2,
                          width: 117,
                          height: 32,
                          radius: 7,
                          color: DarkTheme.greyScale800,
                          colorRadius: DarkTheme.primaryBlue600,
                          child: Center(
                            child: Text(
                              'Change Avatar',
                              style: TxtStyle.headline6MediumBlue,
                            ),
                          ),
                        ),
                        Text(
                          'Edit avatar are visible only on ontari.',
                          style: TxtStyle.headline6MediumGrey,
                        ),
                      ],
                    ),
                  ),
                  right: const Text(''),
                ),
              ),
              const TitleOptionSettings(
                title: 'EDIT INFORMATION',
                height: 32,
                color: DarkTheme.primaryBlueButton,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: buildTextFieldFirstName(user.displayFirstName),
                    ),
                    buildTextFieldLastName(user.displayLastName),
                    const SizedBox(height: 24),
                    buildTextFieldUserName(user.displayUserName),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: buildTextFieldEmail(user.displayEmail),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldString(
    String title,
    String hintText,
    String assetName,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TxtStyle.headline4SemiBoldWhite),
        const SizedBox(height: 10),
        TextFieldSearchBar(
          hintText: hintText,
          childPrefixIcon: CustomAvatar(
            width: 15,
            height: 15,
            assetName: assetName,
          ),
          textController: controller,
        ),
      ],
    );
  }
}
