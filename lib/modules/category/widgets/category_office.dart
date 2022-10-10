import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';

import '../../../assets/assets_path.dart';
import '../../../themes/text_style.dart';
import '../../../widgets/stateless/common_bodyitem.dart';

class CategoryOffice extends StatelessWidget {
  const CategoryOffice({
    Key? key,
    this.assetIcon,
    this.title,
    this.countMentor,
    this.onTap,
  }) : super(key: key);

  final String? assetIcon, title, countMentor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyItemAsset(
          onTap: onTap,
          assetName: AssetPath.imgBackgroundItems,
          widthImg: 48,
          height: 48,
          //paddingDivider: 20,
          //colorDivider: DarkTheme.colorDivider,
          mid: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: TxtStyle.headline4SemiBoldWhite,
                ),
                Text(
                  countMentor!,
                  style: TxtStyle.headline6MediumGrey,
                ),
              ],
            ),
          ),
          right: const Image(
            width: 24,
            height: 24,
            alignment: Alignment.centerRight,
            image: AssetImage(
              AssetPath.iconArrowRight,
            ),
          ),
          child: Image(image: AssetImage(assetIcon!)),
        ),
        const SizedBox(height: 20),
        const Divider(color: DarkTheme.colorDivider),
      ],
    );
  }
}
