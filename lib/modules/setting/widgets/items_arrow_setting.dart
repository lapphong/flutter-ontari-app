import 'package:flutter/material.dart';

import '../../../assets/assets_path.dart';
import '../../../themes/text_style.dart';
import '../../../widgets/stateless/common_bodyitem.dart';

class ItemsArrowSetting extends StatelessWidget {
  const ItemsArrowSetting({
    Key? key,
    this.title,
    this.assetName,
    required this.onTap,
  }) : super(key: key);

  final String? title, assetName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BodyItemAsset(
      onTap: onTap,
      assetName: AssetPath.imgBackgroundItems,
      height: 32,
      widthImg: 32,
      mid: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Center(
          child: Text(
            title!,
            style: TxtStyle.headline4SemiBoldWhite,
          ),
        ),
      ),
      right: const Image(
        alignment: Alignment.centerRight,
        image: AssetImage(
          AssetPath.iconArrowRight,
        ),
      ),
      child: Center(
        child: Image(
          image: AssetImage(assetName!),
          width: 16,
          height: 16,
        ),
      ),
    );
  }
}
