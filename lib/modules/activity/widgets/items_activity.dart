import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../assets/assets_path.dart';
import '../../../themes/app_color.dart';
import '../../../themes/text_style.dart';
import '../../../widgets/stateless/common_bodyitem.dart';
import '../../../widgets/stateless/common_button.dart';

class ItemsActivity extends StatelessWidget {
  const ItemsActivity({
    Key? key,
    this.assetName,
    this.title,
    this.name,
    this.percent = 0,
    required this.onTap,
  }) : super(key: key);

  final String? assetName, title, name; //,percentText;
  final double? percent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    int percentText = (percent! * 100).toInt();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title!,
                  style: TxtStyle.headline4SemiBoldWhite,
                ),
                Text(
                  name!,
                  style: TxtStyle.headline6MediumGrey,
                ),
                LinearPercentIndicator(
                  barRadius: const Radius.circular(10),
                  lineHeight: 5,
                  percent: percent!,
                  width: 200,
                  progressColor: DarkTheme.primaryBlue600,
                  backgroundColor: DarkTheme.greyScale800,
                  padding: const EdgeInsets.only(right: 10),
                  trailing: Text(
                    "$percentText%",
                    style: TxtStyle.headline6MediumGrey,
                  ),
                ),
              ],
            ),
          ),
          right: const Text(''),
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
        const SizedBox(height: 22),
        const Divider(color: DarkTheme.colorDivider),
      ],
    );
  }
}
