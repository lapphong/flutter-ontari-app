import 'package:flutter/material.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/setting/widgets/items_language.dart';
import 'package:ontari_app/modules/setting/widgets/title_setting.dart';

import '../../../assets/assets_path.dart';
import '../../../themes/app_color.dart';
import '../../../themes/text_style.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleSetting(title: 'Change Language'),
                buildListView(language),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int selectedIndex = 0;
  ListView buildListView(List<ModelSetting> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 26.0),
          child: ItemLanguage(
            onTap: () {
              setState(() => selectedIndex = index);
              print(index);
            },
            iconChecked: selectedIndex == index
                ? const Image(
                    image: AssetImage(AssetPath.iconChecked),
                    color: DarkTheme.primaryBlue600,
                  )
                : const Text(''),
            style: selectedIndex == index
                ? TxtStyle.headline4.copyWith(
                    color: DarkTheme.primaryBlue600,
                  )
                : TxtStyle.headline4,
            assetName: list[index].iconUrl,
            nameLang: list[index].title,
          ),
        );
      },
    );
  }
}
