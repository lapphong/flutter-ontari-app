import 'dart:ui';

import 'package:flutter/material.dart';

import '../../assets/assets_path.dart';
import '../../themes/app_color.dart';
import '../../themes/text_style.dart';
import 'common_button.dart';

class ClassPreview extends StatelessWidget {
  const ClassPreview({
    Key? key,
    required this.title,
    required this.assetName,
  }) : super(key: key);

  final String title, assetName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      //height: 182,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(assetName),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 72,
            height: 28,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: DarkTheme.colorImgPreview,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Preview',
                  style: TxtStyle.headline6MediumWhite,
                ),
              ),
            ),
          ),
          //const SizedBox(height: 43),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56.0),
            child: SizedBox(
              height: 115,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.hardEdge,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircleButton(
                      widthIcon: 20,
                      heightIcon: 20,
                      assetPath: AssetPath.iconPlay,
                      bgColor: DarkTheme.white.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //const SizedBox(height: 23.4),
          Container(
            //width: 152,
            height: 39,
            decoration: BoxDecoration(
              color: DarkTheme.colorImgPreview,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            clipBehavior: Clip.hardEdge,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
              child: Center(
                child: Text(
                  title,
                  style: TxtStyle.headline4SemiBoldWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
