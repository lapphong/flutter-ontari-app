import 'package:flutter/material.dart';
import 'package:ontari_app/models/user.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/setting/pages/change_language_page.dart';
import 'package:ontari_app/modules/setting/pages/download_video_page.dart';
import 'package:ontari_app/modules/setting/pages/my_favorite_page.dart';
import 'package:ontari_app/modules/setting/widgets/item_account.dart';
import 'package:ontari_app/modules/setting/widgets/items_arrow_setting.dart';
import 'package:ontari_app/modules/setting/widgets/items_toggle_setting.dart';
import 'package:ontari_app/modules/setting/widgets/title_option_setting.dart';

import '../../../assets/assets_path.dart';
import '../../../blocs/app_state_bloc.dart';
import '../../../providers/bloc_provider.dart';
import '../../../routes/route_name.dart';
import '../../../widgets/stateful/toggle_switch_button.dart';
import '../../../widgets/stateless/common_button.dart';
import '../../../widgets/stateless/show_alert_dialog.dart';
import '../bloc/change_theme_bloc.dart';
import '../bloc/setting_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  SettingBloc? get _bloc => BlocProvider.of<SettingBloc>(context);
  ChangeThemeBloc? get _blocTheme => BlocProvider.of<ChangeThemeBloc>(context);

  void _logOut(BuildContext context) {
    final appStateBloc = BlocProvider.of<AppStateBloc>(context);
    appStateBloc!.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Setting', style: TxtStyle.title),
                        const SizedBox(width: 100),
                        Row(
                          children: [
                            const Image(
                              image: AssetImage(AssetPath.iconDarkMode),
                            ),
                            StreamBuilder<bool>(
                              stream: _blocTheme!.appMode,
                              builder: (context, snapshot) {
                                final valueMode = snapshot.data ?? true;
                                return ToggleSwitchButton(
                                  value: valueMode,
                                  onChanged: (value) =>
                                      _blocTheme!.changeAppMode(value),
                                );
                              },
                            ),
                          ],
                        ),
                        const SquareButton(
                          bgColor: DarkTheme.greyScale800,
                          edge: 40,
                          radius: 10,
                          child: ImageIcon(
                            size: 13,
                            color: DarkTheme.white,
                            AssetImage(AssetPath.iconBell),
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<User?>(
                    stream: _bloc!.userStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final detail = snapshot.data!;
                        return SettingAccount(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              RouteName.editProfilePage,
                              arguments: detail,
                            );
                          },
                          fullName:
                              '${detail.displayFirstName} ${detail.displayLastName}',
                          userName: '${detail.displayUserName} ',
                          assetName: '${detail.imgUrl}',
                        );
                      }
                      if (snapshot.hasError) {
                        return const SliverFillRemaining(
                          child: Center(child: Text('Something went wrong')),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: buildTitleOptionSettings('ACCOUNT SETTING'),
            ),
            buildListView(accountSetting, 0),
            buildTitleOptionSettings('APPLICATION'),
            const SizedBox(height: 16),
            buildListView(application, 0),
            //buildListView(applicationToggle, 1),
            const TitleOptionSettings(
              height: 16,
              color: DarkTheme.greyScale800,
            ),
            buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to logout',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true) {
      _logOut(context);
    }
  }

  Padding buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: TextButton(
        onPressed: () {
          _confirmSignOut(context);
        },
        child: Text(
          'Logout',
          style: TxtStyle.headline4.copyWith(color: DarkTheme.red),
        ),
      ),
    );
  }

  TitleOptionSettings buildTitleOptionSettings(String title) {
    return TitleOptionSettings(title: title, color: DarkTheme.greyScale800);
  }

  // check == 0 : item child ListView is arrow right
  ListView buildListView(List<ModelSetting> list, int check) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return check == 0
            ? Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                child: ItemsArrowSetting(
                  onTap: () {
                    goToPage(context, index, list);
                  },
                  assetName: list[index].iconUrl,
                  title: list[index].title,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
                child: ItemsToggleSetting(
                  onTap: () {
                    chooseOption(context, index, list);
                  },
                  assetName: list[index].iconUrl,
                  title: list[index].title,
                ),
              );
      },
    );
  }

  void chooseOption(BuildContext context, int index, List<ModelSetting> list) {
    if (list == applicationToggle) {
      switch (index) {
        case 0:
          print('Notification');
          break;
        case 1:
          print('Dark mode');
          break;
      }
    }
  }

  goToPage(BuildContext context, int index, List<ModelSetting> list) {
    if (list == application) {
      switch (index) {
        case 0:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => DownloadVideoPage()));
          break;
        case 1:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const MyFavoritePage()));
          break;
        case 2:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const LanguagePage()));
          break;
      }
    } else {
      switch (index) {
        case 0:
          print('change phone number');
          break;
        case 1:
          print('password');
          break;
      }
    }
  }
}
