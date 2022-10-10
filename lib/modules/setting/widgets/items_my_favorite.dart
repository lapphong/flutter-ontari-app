import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../assets/assets_path.dart';
import '../../../themes/app_color.dart';
import '../../../themes/text_style.dart';
import '../../../models/model_local.dart';
import '../../../widgets/stateless/common_bodyitem.dart';
import '../../../widgets/stateless/common_button.dart';

class ItemsMyFavorite extends StatelessWidget {
  const ItemsMyFavorite({
    Key? key,
    this.assetName,
    this.title,
    this.name,
    required this.onTap,
  }) : super(key: key);

  final String? assetName, title, name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyItemAsset(
          onTap: onTap,
          height: 64,
          widthImg: 64,
          assetName: assetName!,
          mid: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title!,
                  style: TxtStyle.headline4SemiBoldWhite,
                ),
                Text(
                  name!,
                  style: TxtStyle.headline6MediumGrey,
                ),
              ],
            ),
          ),
          right: buildPopupMenu(context),
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.hardEdge,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircleButton(
                    assetPath: AssetPath.iconPlay,
                    bgColor: DarkTheme.white.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
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
            ...menuItem.map(buildItem).toList(),
          ],
        ),
      ),
    );
  }

  onSelected(BuildContext context, ModelSetting item) {
    switch (item) {
      case itemShare:
        break;
      case itemDownload:
        break;
      case itemRemove:
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
