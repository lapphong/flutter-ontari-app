import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/setting/widgets/items_language.dart';
import 'package:ontari_app/modules/setting/widgets/title_setting.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

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

  ListView buildListView(List<ModelSetting> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 26.0),
          child: ItemLanguage(
          
            assetName: list[index].iconUrl,
            nameLang: list[index].title,
          ),
        );
      },
    );
  }
}
