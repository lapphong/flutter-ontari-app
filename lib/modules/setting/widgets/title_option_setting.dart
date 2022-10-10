import 'package:flutter/material.dart';

import '../../../themes/text_style.dart';

class TitleOptionSettings extends StatelessWidget {
  const TitleOptionSettings({
    Key? key,
    this.title = '',
    this.height = 32,
    this.color,
  }) : super(key: key);

  final String title;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      color: color,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(
            title,
            style: TxtStyle.headline6MediumGrey,
          ),
        ),
      ),
    );
  }
}
