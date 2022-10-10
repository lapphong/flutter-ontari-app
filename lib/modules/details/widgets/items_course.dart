import 'package:flutter/material.dart';

import '../../../assets/assets_path.dart';
import '../../../themes/app_color.dart';
import '../../../themes/text_style.dart';
import '../../../widgets/stateless/common_bodyitem.dart';

class ItemsCourse extends StatelessWidget {
  const ItemsCourse({
    Key? key,
    this.assetName,
    this.title,
    this.part,
    this.time,
    this.onTap,
  }) : super(key: key);

  final String? assetName, title, part, time;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyItemAsset(
          onTap: onTap,
          height: 80,
          widthImg: 112,
          assetName: assetName!,
          mid: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: TxtStyle.titleCourseList,
                ),
                Text(
                  part!,
                  style: TxtStyle.headline5MediumWhite,
                ),
              ],
            ),
          ),
          right: Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 0.8,
                  color: DarkTheme.white.withOpacity(0.2),
                ),
              ),
              child: Image.asset(
                AssetPath.iconDownload,
                height: 20,
                width: 20,
              ),
            ),
          ),
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
                  child: Text(
                    time!,
                    style: TxtStyle.textTimeCourse,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Divider(color: DarkTheme.greyScale50.withOpacity(0.8)),
      ],
    );
  }
}
