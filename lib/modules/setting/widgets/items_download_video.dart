import 'package:flutter/material.dart';
import 'package:ontari_app/widgets/stateless/common_bodyitem.dart';

import '../../../assets/assets_path.dart';
import '../../../themes/app_color.dart';
import '../../../themes/text_style.dart';
import '../../../models/model_local.dart';

class ItemsDownloadVideo extends StatelessWidget {
  const ItemsDownloadVideo({
    Key? key,
    this.assetName,
    this.part,
    this.title,
    this.name,
  }) : super(key: key);

  final String? assetName, part, title, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyItemAsset(
          height: 88,
          widthImg: 112,
          assetName: assetName!,
          mid: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(part!, style: TxtStyle.textCourse),
                Text(title!, style: TxtStyle.headline4SemiBoldWhite),
                Text(name!, style: TxtStyle.headline5MediumWhite),
              ],
            ),
          ),
          right: buildPopupMenu(context),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
              child: SizedBox(
                width: 36,
                height: 18,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: DarkTheme.greyScale700,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '10:09',
                    style: TxtStyle.textTimeCourse,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),
        Divider(color: DarkTheme.greyScale50.withOpacity(0.8)),
      ],
    );
  }

  Align buildPopupMenu(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        width: 20,
        height: 20,
        child: PopupMenuButton<ModelSetting>(
          onSelected: (item) => onSelected(context, item),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(0),
          icon: const Image(image: AssetImage(AssetPath.iconMore)),
          position: PopupMenuPosition.under,
          color: DarkTheme.colorMenuDialog,
          itemBuilder: (context) => [
            ...menuItemDownload.map(buildItem).toList(),
          ],
        ),
      ),
    );
  }

  onSelected(BuildContext context, ModelSetting item) {
    switch (item) {
      case itemPlayVideo:
        //print('play');
        break;
      case itemRemove:
        //print('remove');
        break;
    }
  }

  PopupMenuItem<ModelSetting> buildItem(ModelSetting item) {
    return PopupMenuItem(
      value: item,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Image(
              width: 20,
              height: 20,
              image: AssetImage(item.iconUrl),
            ),
            const SizedBox(width: 14),
            Text(
              item.title,
              style: TxtStyle.headline5MediumWhite2,
            ),
          ],
        ),
      ),
    );
  }
}
