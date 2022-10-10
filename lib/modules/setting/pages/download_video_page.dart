import 'package:flutter/material.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/setting/widgets/items_download_video.dart';
import 'package:ontari_app/modules/setting/widgets/title_setting.dart';
import 'package:ontari_app/widgets/stateless/common_avatar.dart';
import 'package:ontari_app/widgets/stateful/common_textfield.dart';

import '../../../assets/assets_path.dart';

class DownloadVideoPage extends StatelessWidget {
  DownloadVideoPage({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

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
                const TitleSetting(title: 'Download Video'),
                TextFieldSearchBar(
                  textController: _searchController,
                  hintText: 'Search your focus...',
                  childPrefixIcon: const CustomAvatar(
                    width: 16,
                    height: 16,
                    assetName: AssetPath.iconSearch,
                  ),
                ),
                const SizedBox(height: 20),
                buildListView(downloadItem),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView buildListView(List<ModelSettingDownload> list) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ItemsDownloadVideo(
            assetName: list[index].imgUrl,
            part: list[index].part,
            title: list[index].title,
            name: list[index].name,
          ),
        );
      },
    );
  }
}
