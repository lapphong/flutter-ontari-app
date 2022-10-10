import 'package:flutter/material.dart';

import '../../themes/app_color.dart';
import '../../themes/text_style.dart';

class Mentor extends StatelessWidget {
  const Mentor({
    Key? key,
    required this.assetName,
    required this.title,
    required this.name,
    this.onTap,
  }) : super(key: key);

  final String? assetName, title, name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 182,
        decoration: const BoxDecoration(
          color: DarkTheme.greyScale800,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Container(
              width: 144,
              height: 128,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: DarkTheme.colorImgMentor,
                image: DecorationImage(
                  image: AssetImage(assetName!),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title!,
              style: TxtStyle.headline6MediumGrey,
            ),
            const SizedBox(height: 6),
            Text(
              name!,
              style: TxtStyle.headline4SemiBoldWhite,
            ),
          ],
        ),
      ),
    );
  }
}
