import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../themes/text_style.dart';

class ItemsSubjects extends StatelessWidget {
  const ItemsSubjects({
    Key? key,
    this.title,
    this.assetName,
  }) : super(key: key);

  final String? title, assetName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              assetName!,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.4, sigmaY: 0.4),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  title!,
                  style: TxtStyle.currentPlan,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
