import 'package:flutter/material.dart';

import '../../../assets/assets_path.dart';
import '../../../themes/text_style.dart';
import '../../../widgets/stateless/common_bodyitem.dart';

class ItemsSubjectsGet extends StatelessWidget {
  const ItemsSubjectsGet({
    Key? key,
    this.assetName,
    this.title,
  }) : super(key: key);

  final String? assetName, title;

  @override
  Widget build(BuildContext context) {
    return BodyItemAsset(
      assetName: AssetPath.imgBackgroundItems,
      height: 32,
      widthImg: 32,
      mid: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Center(
          child: Text(
            title!,
            style: TxtStyle.headline4SemiBoldWhite,
          ),
        ),
      ),
      right: const Text(''),
      child: Center(
        child: Image(
          image: AssetImage(assetName!),
          width: 15,
          height: 15,
        ),
      ),
    );
  }
}
